#$wtpreview = "C:\Program Files\WindowsApps\Microsoft.WindowsTerminalPreview_1.16.2642.0_x64__8wekyb3d8bbwe\wt.exe"
$wtpreview = "wt.exe"
$repo_dcs = "d:\git\indica\dotnet-core-services"
$repo_indica = "d:\git\indica\indica-labs-2"

$algorithm = "multiplexing"
#$algorithm = "her-2"

$repo_modules = "d:\git\indica\analysis-modules\$algorithm"

& $wtpreview `
  -p "Git Bash" --title indica-labs --suppressApplicationTitle -d $repo_indica `; `
  <# ---- algorithm dev #> `
  <# -p "Git Bash" --title $algorithm --suppressApplicationTitle -d $repo_modules `; ` #> `
  <# -p "Git Bash" --title module-tools --suppressApplicationTitle -d $repo_modules\module-tools `; ` #> `
  <# -p "Git Bash" --title module-framework --suppressApplicationTitle -d $repo_modules\module-framework `; ` #> `
  <# ---- NOTE: GraphQL web and IdP web both want to run on 8080. If GraphQL web is needed for the workbench, you can run IdP as a service. #> `
  -p "Git Bash" --title "GraphQL web" -d $repo_dcs\research\src\IndicaLabs\ApplicationLayer\Halo\GraphQLApi '"C:\Program Files (x86)\Yarn\bin\yarn.cmd"' dev `; `
  <# -p "Git Bash" --title "IdP web" -d $repo_dcs\core\src\IndicaLabs\ApplicationLayer\Halo\IdentityProvider '"C:\Program Files (x86)\Yarn\bin\yarn.cmd"' dev `; `#> `
  <# -p "Windows PowerShell" --title "IdentityProvider" -d $repo_dcs\core\src\IndicaLabs\ApplicationLayer\Halo\IdentityProvider powershell -noexit dotnet run --no-build `; ` #>`
  <# ---- services #> `
  -p "Windows PowerShell" --title "Gateway Server" -d $repo_dcs\core\src\IndicaLabs\ApplicationLayer\Gateway\Server powershell -noexit dotnet run --no-build `; `
  -p "Windows PowerShell" --title "gRPC" -d $repo_dcs\research\src\IndicaLabs\ApplicationLayer\Halo\GrpcApi powershell -noexit dotnet run --no-build `; `
  -p "Windows PowerShell" --title "GraphQL" -d $repo_dcs\research\src\IndicaLabs\ApplicationLayer\Halo\GraphQLApi powershell -noexit dotnet run --no-build `; `
  <# ---- Git Bash for dotnet-core-services #> `
  -p "Git Bash" --title dotnet-core-services --suppressApplicationTitle -d $repo_dcs
