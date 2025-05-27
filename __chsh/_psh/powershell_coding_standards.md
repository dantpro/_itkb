# PowerShell standards 1.0

----

## 1. Coding Style
The purpose of this section is to define rules to ensure code which affects the appearance of code rather than the functionality.

### 1.1. No aliases in scripts or functions
Always use the full command and parameter names in scripts and functions as aliases are should only be used in console sessions. Using aliases will produce inconsistent code as you will end up with a combination of alias and full commands which results in reduced readability. This also applies to the symbol aliases such as:

* % = **ForEach-Object**
* ? = **Where-Object**
* ! = **-not**

Take advantage of the PowerShell ISE intellisense tab feature to auto complete cmdlet and parameter names.

### 1.2 Use approved verbs ([Windows PowerShell Approved Verbs](https://msdn.microsoft.com/en-us/library/ms714428(v=vs.85).aspx))
When writing functions use the published list of approved verbs. Failing to do so will give users a warning when importing a module.

### 1.3. Consistent Indentation level
If using an alternative text editor then stick to the PowerShell ISE behavior which is four spaces for each level of indentation.

### 1.4. Formatting Arrays & Hash tables
Define arrays items and hash table properties over multiple lines
```
$array = @(
	"item1"
	"item2"
)

$hashtable = @{
	name = "john"
	food = "pizza"
}
```

### 1.5 Avoid adding semicolon to line endings
There is no need to add semicolons on the end of lines, even when defining array or hashtable items providing they are defined over multiple lines.

### 1.6. Provide documentation using Comment Best Help ([about_Comment_Based_Help](https://technet.microsoft.com/en-us/library/hh847834.aspx))
There is a standard syntax for writing help associated with a script or function called comment based help. This is defined in a multi line comment just before a function using special keywords. This makes the help for a given script or function discoverable through the Get-Help cmdlet.

There is no need to go overkill here as not all functions require a full compilation of help, but if you are providing documentation then this is the best approach.

Ensure that each parameter is documented, and provide examples for each use case.
```
<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.PARAMETER ParameterName
The description of this parameter. Repeat for each available parameter
.EXAMPLE
   Verb-Noun
   This will get all objects
.EXAMPLE
   Verb-Noun -Name "test"
   This will get the object named test
.EXAMPLE
   $Object | Verb-Noun
   This will process a collection of objects from the pipeline
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function Verb-Noun
...
```

### 1.7. Use Inline comments
When writing inline comments avoid writing them on the same line as code, and ensure there is a space between the comment and the hash symbol.
```
# Check notepad is running and stop if its not
Get-Process -name notepad -ErrorAction Stop
```

### 1.8 Use PascalCase for parameter names
This style is used for all standard PowerShell cmdlets and should be followed for consistency. Once a parameter or variable has been named the PowerShell ISE will tab autocomplete to the correct case.

 ----
 
## 2. Design Guide
The purpose of this section is to define design patterns and functional standards to produce code and which is more reliable and capable of providing better feedback to the user. By applying constraints you can make scripts safer and easier for users to pick up and start using them.

### 2.1. Always use native PowerShell
Where possible you should stick to the native PowerShell method of completing an operation. Avoid using Batch commands, external executables, and .NET libraries unless there is a specific reason for not using the PowerShell equivalent. If there is a valid reason for preferring an alternative to a native PowerShell cmdlet, then document the reason as an inline comment.

### 2.2. Behave like PowerShell
This is really a mindset rather than a complete set of well defined rules, but try to remember that any script or function you write will be much easier for other users to understand if it behaves like a standard PowerShell cmdlet.

### 2.3. Use standard parameter names
Making a script or function use the same parameter names as standard cmdlets where possible is recommended to help make scripts or functions behave more like real PowerShell.

Examples:
* **-Path** rather than **-PathToThisFile**
* **-Credential** rather than **-LoginDetails**
* **-ComputerName** rather than **-TargetSystem**

### 2.4. Use singular parameter names
When defining parameters you should prefer singular parameter names such as **-ComputerName** vs **-ComputerNames**. In a situation where a parameter only accepts multiple items use the plural name and force validation to check that multiple items have actually been supplied.

### 2.5. Define script dependencies using the **#Requires** statement ([about_Requires](https://technet.microsoft.com/en-us/library/hh847765.aspx))
This is all about preventing a script from running and failing if there are missing dependencies. Rather than writing custom logic there is built in syntax for defining requirements such as:

 * Minimum PowerShell version
 * Modules
 * Administrative elevation

Simply include the #Requires statement within a script, multiple statements are supported
```
#Requires -RunAsAdministrator
#Requires -Version 5.0
```

```
#Requires -Modules Azure, @{ModuleName="Azure";ModuleVersion=0.9.8.1}
```

### 2.6. Define mandatory parameters ([about_Functions_Advanced_Parameters](https://technet.microsoft.com/en-us/library/hh847743.aspx))

This will prevent a script or function from executing until all mandatory parameters have been provided. If running in a console session the user will be prompted to supply values.

```
Function Test-Function
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True)]
        $Param1,

        [Parameter(Mandatory = $False)]
        $Param2
    )
}
```

### 2.7. Always cast parameters to the expected data type
This simply ensures a parameter ensures the correct type of data. Including but not limited to:

* **[string]** =    Fixed-length string of Unicode characters
* **[char]** =      A Unicode 16-bit character
* **[byte]** =      An 8-bit unsigned character
* **[int]** =       32-bit signed integer
* **[long]** =      64-bit signed integer
* **[bool]** =      Boolean True/False value
* **[decimal]** =   A 128-bit decimal value
* **[single]** =    Single-precision 32-bit floating point number
* **[double]** =    Double-precision 64-bit floating point number
* **[DateTime]** =  Date and Time
* **[xml]** =       Xml object
* **[array]** =     An array of values
* **[hashtable]** = Hashtable object

```
Function Test-Function
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True)]
        [string]
        $Param1,

        [Parameter(Mandatory = $False)]
        [int]
        $Param2
    )
}
```

### 2.8. Parameter validation ([about_Functions_Advanced_Parameters](https://technet.microsoft.com/en-us/library/hh847743.aspx))

Enforcing parameter validation allows constraints to be applied parameters such as the length of a string, setting minimum or maximum integer values, preventing null or empty values, or even run a script block against a parameter value to evaluate whether or not the value is suitable.

This is really important as it prevents a script or function from even starting unless suitable values have been provided, and keeps all validation logic neatly contained within the Param() block at the start.
 
Example:
```
Function Test-Function
{
    [CmdletBinding()]
    Param(

        [ValidateSet("Start", "Stop", "Restart", "Status")]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true)]
        [string]$Param1,
        
        [ValidateRange(7,30)]
        [Parameter(Mandatory=$false)]
        [int]$Param2
    )
}
```

Another use case is when passing a file path as a parameter you can perform a Test-Path using a validation script
```
Function Test-Function
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True)]
        [ValidateScript({
            If(Test-Path $_ -PathType Leaf){
                $True
            }
            else{
                Throw "Invalid File path $_"
            }
        })]
        $Path
    )
}
```

### 2.9. Consider supplying default values for parameters ([about_Parameters](https://technet.microsoft.com/en-us/library/hh847824.aspx))

This can make executing scripts easier and more flexible, by allowing you to include additional parameters without necessarily requiring additional input values. Supplying a default value for a mandatory parameters does not have any effect as they are always overwritten at run time.
In the example below $Param2 has a default value of 14 if not specified, but can be specified by a user at run time.

Example:
```
Function Test-Function
{
    [CmdletBinding()]
    Param(

        [ValidateSet("Start", "Stop", "Restart", "Status")]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true)]
        [string]$Param1,
        
        [ValidateRange(7,30)]
        [Parameter(Mandatory=$false)]
        [int]$Param2 = 14
    )
}
```

### 2.10. Include the CmdletBinding attribute ([about_Functions_CmdletBindingAttribute](https://technet.microsoft.com/en-us/library/hh847872.aspx))

You should always include the CmdletBinding attribute as this will add a set of common parameters. In its basic form this makes it simple to adjust the debug, verbose, and information output streams at run time for a script or function, as well as providing the standard error handling parameters.

To use the CmdletBinding attribute it must be declared before a Param() block.
```
Function Test-Function {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Param1,

        [Parameter(Mandatory=$false)]
        [int]$Param2

    )
}
```

**[CmdletBinding()]** adds the following common parameters:

* **-Debug**
* **-ErrorAction**
* **-ErrorVariable**
* **-InformationAction**
* **-InformationVariable**
* **-OutVariable**
* **-OutBuffer**
* **-PipelineVariable**
* **-Verbose**
* **-WarningAction**
* **-WarningVariable**

Adding the ***SupportsShouldProcess = $True*** argument adds the following common parameters:

* **-WhatIf**
* **-Confirm**

The **SupportsShouldProcess** argument can then be checked within a function or script using the **$PSCmdlet.ShouldProcess** variable within the code to provide a confirmation prompt if for certain actions when executed with the -Confirm switch.
```
function Verb-Noun{
[CmdletBinding(
    SupportsShouldProcess = $True
)]
Param()

    begin{
        Write-Verbose "Hello world"
    }

    process{            
        if ($PSCmdlet.ShouldProcess){   
            Write-Debug "Creating directory"         
            New-Item -ItemType Directory -Name test        
        }            
    }

    end{}

}

# Run the function in WhatIf mode with debug Output
Verb-Noun -Verbose -WhatIf

# Run the function with a confirmation prompt with verbose output
Verb-Noun -Verbose -Confirm
```

### 2.11. When importing modules consider using the following parameters 
You should use a standard set of parameters on Import-Module commands for consistency.

* The **-Force** parameter switch will re-import the module if it has changed on disk which is useful for debugging
* Suppress  **Verbose** for this cmdlet as importing modules in verbose mode can often flood the console output with the name of every imported cmdlet
* Set the **ErrorAction** to stop if a module fails to import

```
Import-Module "<modulepath>.psm1" -Force -ErrorAction Stop -Verbose:$false
```

### 2.12. Avoid using Write-Host ([PowerShell Output Streams](https://blogs.technet.microsoft.com/heyscriptingguy/2015/07/04/weekend-scripter-welcome-to-the-powershell-information-stream/))
Rather than using Write-Host you should consider using the appropriate output stream which will allow greater control of the console output, and more consistent feedback in the same format as native cmdlets. This allows additional outputs to be added for debugging or troubleshooting purposes, which can easily by switched off at runtime.

1. Output (Write-Output)
2. Error (Write-Error)
3. Warning (Write-Warning)
4. Verbose (Write-Verbose)
5. Debug  (Write-Debug)
6. Information (Write-Information, 5.0+)

----

## 3. Module structure
The purpose of this section is to describe the best practice for the layout of components within a custom module.

### 3.1 Store each function in a single .ps1 file
Typically a PowerShell module is a **.psm1** file which does not lend itself to keeping things organized very well as you would end up with either 
* Many functions within a single **.psm1** file which can be difficult to maintain
* OR
*  Many individual **.psm1** modules which is a management overhead

The solution is to use a **.psm1** module which references many other files upon import, consolidating many seperate .ps1 files into a single importable module. This approach means additional functions can easily be made available without requiring additional Import-Module commands to be added to a script
```
$Functions = Get-ChildItem -Recurse -Filter *.ps1

foreach ($Function in $Functions){
    . $Function.FullName
}
```
### 3.2 Recommended module file system structure
```
ModuleName\ModuleName.psm1
ModuleName\ModuleName.psd1
ModuleName\Private\Verb-Noun1.ps1
ModuleName\Private\Verb-Noun1.Tests.ps1
ModuleName\Public\Verb-Noun2.ps1
ModuleName\Public\Verb-Noun2.Tests.ps1
```

----

## 4. Useful Tools
The purpose of this section is to include third party tools or frameworks that should be used to improve quality of written code.

* [PSScriptAnalyzer - Static Code Analysis](https://github.com/PowerShell/PSScriptAnalyzer)
* [Pester - PowerShell Testing framework](https://github.com/pester/Pester)

-----

## 5. References
### 5.1. [Windows PowerShell Core About Topics](https://technet.microsoft.com/en-us/library/hh847856.aspx) - This page is essentially the PowerShell manual and explains all of the inner workings
### 5.2. [Windows PowerShell Cmdlet Concepts](https://msdn.microsoft.com/en-us/library/dd878268(v=vs.85).aspx) - This page is written for when developing PowerShell cmdlets in .NET, although the same rules  apply as it is best practice to develop scripts and functions which behave the same as built in cmdlets.
### 5.3. [Windows PowerShell Approved Verbs](https://msdn.microsoft.com/en-us/library/ms714428(v=vs.85).aspx)
### 5.4. [PowerShell Practice and Style](https://poshcode.gitbook.io/powershell-practice-and-style)
### 5.5. [PowerShell Practice and Style Github](https://github.com/PoshCode/PowerShellPracticeAndStyle)




