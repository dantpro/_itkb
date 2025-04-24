#
# Examples using PowerShell script and function parameters
#

# Give the script some of the standard PowerShell parameters like -Verbose and -Debug
[CmdletBinding()]
Param (
    # Make this parameter mandatory, so no default value
    [Parameter(Mandatory=$true)]
    [string] $FirstParameterAsString,
    
    # This parameters is not mandatory, so let's give it a default value
    [int] $NextParameterAsInteger = -999
)

# This causes the PowerShell interpreter to use strict checking on things like
# whether we've declared variables before using. Rather than set a version
# of PowerShell for the checking, we'll use the latest - whatever is installed.
Set-StrictMode -Version Latest

# Always helps to clear the console before doing anything...
Clear-Host

#
#
#
Function LogToConsole([string] $message)
{
    Write-Host "====="
    Write-Host $message "...`r`n"
}

#
# TestFunctionWithStringAndIntegerArgs
#
Function TestFunctionWithStringAndIntegerArgs([string] $stringArg1, [int] $intArg2)
{
    If ($stringArg1)
    {
        Write-Host "stringArg1 is not null: $stringArg1"
    }
    Else
    {
        Write-Host "stringArg1 is null"        
    }
    
    If ($intArg2)
    {
        Write-Host "intArg2 is not null: $intArg2"
    }
    Else
    {
        Write-Host "intArg2 is null"
    }
    
    # The following string will be "emitted" as the result of this function
    "Done with function"
}

# 
# Main
#

# Show the actual parameter values
LogToConsole "Show the actual parameter values"
Write-Host "FirstParameterAsString = $FirstParameterAsString"
Write-Host "NextParameterAsInteger = $NextParameterAsInteger"

# Call the function and capture its output in a variable
LogToConsole "Call the function and capture its output in a variable"
$resultWithValues = TestFunctionWithStringAndIntegerArgs -stringArg1 "a real string" -intArg2 1

# Show what the function "emitted"
LogToConsole "Show what the function 'emitted'"
$resultWithValues

# Call the function without capturing its output - i.e.,
# this time we will simply show the function output to the
# console.
LogToConsole "Call the function without capturing its output"
TestFunctionWithStringAndIntegerArgs
