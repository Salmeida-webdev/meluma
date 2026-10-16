$ErrorActionPreference = "Stop"

$RepositoryUrl = "https://github.com/Salmeida-webdev/meluma.git"
$ProjectRoot = $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git não foi encontrado. Instale o Git for Windows e execute este script novamente."
}

Set-Location $ProjectRoot

if (-not (Test-Path (Join-Path $ProjectRoot ".git"))) {
    git init -b main
    if ($LASTEXITCODE -ne 0) { throw "Não foi possível inicializar o repositório local." }
}

git branch -M main
if ($LASTEXITCODE -ne 0) { throw "Não foi possível selecionar a branch main." }

$ExistingRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
    git remote set-url origin $RepositoryUrl
} else {
    git remote add origin $RepositoryUrl
}
if ($LASTEXITCODE -ne 0) { throw "Não foi possível configurar o endereço do repositório." }

git add --all
if ($LASTEXITCODE -ne 0) { throw "Não foi possível preparar os arquivos." }

$PendingChanges = git status --porcelain
if ($PendingChanges) {
    git commit -m "feat: publish MELUMA concept landing page"
    if ($LASTEXITCODE -ne 0) {
        throw "O commit falhou. Confira sua configuração de nome e e-mail do Git."
    }
}

git push --set-upstream origin main
if ($LASTEXITCODE -ne 0) {
    throw "O envio falhou. Confirme o login/autorização do GitHub e tente novamente."
}

Write-Host "Publicado em https://github.com/Salmeida-webdev/meluma"
