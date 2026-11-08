# Build the site and publish dist/ to the gh-pages branch (GitHub Pages serves that branch).
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
npm.cmd run build | Out-Null
$wt = Join-Path $env:TEMP 'kcc-gh-pages'
if (Test-Path $wt) { git worktree remove --force $wt 2>$null; Remove-Item -Recurse -Force $wt -ErrorAction SilentlyContinue }
git fetch origin gh-pages
git worktree add -f $wt origin/gh-pages
Get-ChildItem $wt -Force | Where-Object { $_.Name -ne '.git' } | Remove-Item -Recurse -Force
Copy-Item -Recurse -Force (Join-Path $PSScriptRoot 'dist\*') $wt
New-Item -ItemType File -Force (Join-Path $wt '.nojekyll') | Out-Null
Push-Location $wt
git add -A
$msg = "Deploy $(git -C $PSScriptRoot rev-parse --short HEAD)"
git -c user.name="Keyboard Cheat Codes" -c user.email="techkayacodes@users.noreply.github.com" commit -q -m $msg
git push origin HEAD:gh-pages
Pop-Location
git worktree remove --force $wt
Write-Output "Deployed: $msg"
