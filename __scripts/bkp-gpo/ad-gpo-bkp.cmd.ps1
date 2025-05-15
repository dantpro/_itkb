# gpo data/report backup
#
# https://github.com/kcmazie/GPO-Backup
# https://github.com/compwiz32/PowerShell/blob/master/Active-Directory/Backup-GroupPolicy.ps1

### Param
#
[CmdletBinding()]
Param (
    [Parameter()]
    [string]
    $domain = (Get-ADDomainController).Domain,

    [Parameter()]
    [string]
    [Alias("domainController","dc")]
    [ArgumentCompleter( {
        param ( $commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters )
            $possibleValues = @{ Server = (Get-ADDomainController -Filter *).Hostname }
                if ($fakeBoundParameters.ContainsKey('Type')) { $possibleValues[$fakeBoundParameters.Type] | Where-Object { $_ -like "$wordToComplete*" } }
                else { $possibleValues.Values | ForEach-Object {$_} }
    } )]
    $server = (Get-ADDomain | Select-Object PDCEmulator).PDCEmulator,

    [Parameter()]
    [string] 
    $path = ($MyInvocation.MyCommand.Path | Split-Path -Parent),
    
    [Parameter()]
    [int] 
    $history = 5
)
###

### Var
#
$ErrorActionPreference = "silentlycontinue"

$Script:Message = ""

$BkpId = $(Get-Date -Format "yyMMdd_HHmmss")
$LogFile = "$path\gpo_bkp_$($BkpId)" + "\_gpo_bkp.log"
###

### Func
#
function Write-Message {
    param(
        [string]$Msg,
        [string]$Color = "Gray"
    )

    $eol = [Environment]::NewLine

    Write-Host $Msg -ForegroundColor $Color 
    $Script:Message += $Msg + $eol
}
###

### Main
#
Write-Message "---"
Write-Message "--- All GPOs will be backed up to $path\gpo_bkp_$($BkpId)" -Color yellow
Write-Message "---"

Write-Message "--- domain: $domain"
Write-Message "--- server: $server"
Write-Message "---"
Write-Message "--- backup history: $history"
Write-Message "--- backup path: $path"
Write-Message "---"
Write-Message "--- logfile: $LogFile"
Write-Message "---"

Try {
    $AllGPOs = Get-GPO -All -Domain $domain -Server $server

    foreach ($GPO in $AllGPOs) {

        $GPODisplayName = $GPO.DisplayName
        $GPOGuid = $GPO.Id

        Write-Message "Backing up GPO:" -Color Green
        Write-Message $GPODisplayName -Color White
        Write-Message "{$GPOGuid}"
        Write-Message "---"

        # https://learn.microsoft.com/en-us/windows/win32/fileio/naming-a-file
        #
        $TargetGPOName = $GPODisplayName -replace '>|<|:|"|\|/|\?|\*|\|'

        #-$GPOBkpPath = $path + '\gpo_bkp\' +$domain + '\' + $BkpId + '\' + $TargetGPOName + '\'
        #-$GPOBkpPath = $path + '\gpo_bkp_' +$domain + '_' + $BkpId + '\' + $TargetGPOName + '\'
        #
        $GPOBkpPath = $path + '\gpo_bkp_' + $BkpId + '\' + $TargetGPOName + '\' 

        $HTMLReportFile = $GPOBkpPath + $TargetGPOName +'.html'
        $XMLReportFile = $GPOBkpPath + $TargetGPOName +'.xml'

    
        if (-Not (Test-Path $GPOBkpPath)) {
            New-Item -Path $GPOBkpPath -ItemType directory | Out-Null

            Start-Sleep -Seconds 5
        
            $BackupDetail = Backup-GPO -Name $GPO.DisplayName -domain $domain -server $server -Path $GPOBkpPath
            Write-Message ($BackupDetail | Out-String)

            Get-GPOReport -Guid $GPOGuid -ReportType HTML -domain $domain -server $server -Path $HTMLReportFile
            Get-GPOReport -Guid $GPOGuid -ReportType XML -domain $domain -server $server -Path $XMLReportFile
        }
    }
} Catch {
    Write-Message $_.Exception.Message -Color Red
}

Try {
    Write-Message "--- Purging backups, keep last $history..." -Color yellow
    Get-ChildItem -Path $path |
        Where-Object { $_.PsIsContainer -and $_.name -like "gpo_bkp_*" } |
        Sort-Object -Descending -Property LastTimeWrite |
        Select-Object -Skip $history |
        Remove-Item -Recurse -Force
    
} Catch {
    Write-Message $_.Exception.Message -Color Red
}

Write-Message "---"
Write-Message "--- GPO backup to $path\gpo_bkp_$($BkpId) completed." -Color yellow
Write-Message "---"

$Script:Message |
    Out-File -FilePath $Logfile
###
