$Environments = [pscustomobject][ordered]@{
    Name="Delta"
    Prefix="DLT"
},
[pscustomobject][ordered]@{
    Name="Epsilon"
    Prefix="EPS"
},
[pscustomobject][ordered]@{
    Name="Production"
    Prefix="PRD"
},
[pscustomobject][ordered]@{
    Name="Infrastructure"
    Prefix="INF"
}

function get-TervisEnvironmentPrefix {
    param(
        [Parameter(Mandatory)][string]$EnvironmentName
    )
    $Prefix = $Environments | 
    where Name -eq $EnvironmentName | 
    select -ExpandProperty Prefix

    if($Prefix) {$Prefix} else { Throw "No Environment prefix found for $EnvironmentName" }
}

function Get-TervisEnvironmentName {
    $Environments |
    Select -ExpandProperty Name
}