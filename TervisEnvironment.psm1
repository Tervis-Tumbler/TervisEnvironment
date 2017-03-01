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
},
[pscustomobject][ordered]@{
    Name="Zeta"
    Prefix="ZTA"
}

function Get-TervisEnvironmentPrefix {
    param(
        [Parameter(Mandatory)][string[]]$EnvironmentName
    )
    $Prefix = $Environments |
    where Name -in $EnvironmentName |
    select -ExpandProperty Prefix

    if($Prefix) {$Prefix} else { Throw "No Environment prefix found for $EnvironmentName" }
}

function Get-TervisEnvironmentName {
    $Environments |
    Select -ExpandProperty Name
}