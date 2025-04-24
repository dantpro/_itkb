#
# gpo file/report backup
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

$BkpId = $(Get-Date -Format "yyMMdd_HHmmss")

$AllGPOs = Get-GPO -All -Domain $domain -Server $server

Write-Host "---"
Write-Host "--- All GPOs will be backed up to $path\gpo_bkp_$($BkpId)" -foregroundColor yellow
Write-Host "---"

Write-Host "--- domain: $domain"
Write-Host "--- server: $server"
Write-Host "---"
Write-Host "--- backup history: $history"
Write-Host "--- backup path: $path"
Write-Host "---"

foreach ($GPO in $AllGPOs) {

    $GPODisplayName = $GPO.DisplayName
    $GPOGuid = $GPO.Id

    Write-Host "Backing up GPO: " -foregroundColor Green -nonewline
    Write-Host $GPODisplayName -foregroundColor White -nonewline
    Write-Host " {$GPOGuid}`n"
    
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

        #-Write-Output   $GPO.DisplayName $GPOGuid  $((get-date).datetime) "`n"

        Backup-GPO -Name $GPO.DisplayName -domain $domain -server $server -Path $GPOBkpPath
      
        Get-GPOReport -Guid $GPOGuid -ReportType HTML -domain $domain -server $server -Path $HTMLReportFile
        Get-GPOReport -Guid $GPOGuid -ReportType XML -domain $domain -server $server -Path $XMLReportFile
   }
}

Try {
    Write-Host "--- Purging backups, keep last $history...`n" -foregroundColor yellow
    Get-ChildItem -Path $path |
        Where-Object { $_.PsIsContainer -and $_.name -like "gpo_bkp_*" } |
        Sort-Object -Descending -Property LastTimeWrite |
        Select-Object -Skip $history |
        Remove-Item -Recurse -Force #-whatif
    
} Catch {
    $_.Exception.Message
}

Write-Host "---"
Write-Host "--- GPO backup to $path\gpo_bkp_$($BkpId) completed." -foregroundColor yellow
Write-Host "---"
