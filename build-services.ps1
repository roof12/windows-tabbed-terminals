#$wtpreview = "C:\Program Files\WindowsApps\Microsoft.WindowsTerminalPreview_1.16.2642.0_x64__8wekyb3d8bbwe\wt.exe"
#$wtpreview = "wt.exe"
$initialDir = Get-Location
$repo_dcs = "d:\git\indica\dotnet-core-services"

Set-Location -Path "d:\work\windows-terminal"

$service_dirs = `
  "$repo_dcs\core\src\IndicaLabs\ApplicationLayer\Halo\IdentityProvider",
  "$repo_dcs\core\src\IndicaLabs\ApplicationLayer\Gateway\Server",
  "$repo_dcs\research\src\IndicaLabs\ApplicationLayer\Halo\Migrations",
  "$repo_dcs\research\src\IndicaLabs\ApplicationLayer\Halo\GrpcApi",
  "$repo_dcs\research\src\IndicaLabs\ApplicationLayer\Halo\GraphQLApi"

foreach ($dir in $service_dirs) {
  Write-Output "Service dir: $dir"
  Set-Location -Path $dir
  Write-Output "building..."
  Invoke-Expression "dotnet build"
}

Set-Location $initialDir