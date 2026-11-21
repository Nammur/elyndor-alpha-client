$ErrorActionPreference='Stop'
[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
$headers=@{'User-Agent'='ElyndorAlphaInstaller';Accept='application/vnd.github+json'}
$releases=Invoke-RestMethod -Uri 'https://api.github.com/repos/Nammur/elyndor-alpha-client/releases?per_page=20' -Headers $headers
$release=$releases | Where-Object {-not $_.draft -and $_.assets.name -contains 'SHA256SUMS.txt'} | Select-Object -First 1
if(-not $release) {throw 'O pacote ainda nao foi publicado. Aguarde o anfitriao.'}
if($release.tag_name -notmatch '^[a-zA-Z0-9._-]+$') {throw 'Versao invalida.'}
$install=Join-Path $env:USERPROFILE ('Games/ElyndorAlpha/'+$release.tag_name)
$downloads=Join-Path $install '_download'
New-Item -ItemType Directory -Force $downloads | Out-Null
$checksumAsset=$release.assets | Where-Object name -eq 'SHA256SUMS.txt' | Select-Object -First 1
$sumPath=Join-Path $downloads 'SHA256SUMS.txt'
Invoke-WebRequest -UseBasicParsing -Uri $checksumAsset.browser_download_url -OutFile $sumPath
$verified=@()
foreach($line in Get-Content -LiteralPath $sumPath) {
    if($line -notmatch '^([a-fA-F0-9]{64})  (elyndor-alpha-windows\.zip(?:\.part[0-9]{3})?)$') {throw 'Lista de arquivos invalida.'}
    $expected=$matches[1];$name=$matches[2]
    $asset=$release.assets | Where-Object name -eq $name | Select-Object -First 1
    if(-not $asset) {throw ('Falta arquivo na publicacao: '+$name)}
    $target=Join-Path $downloads $name
    if(-not(Test-Path -LiteralPath $target) -or (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash -ne $expected) {
        Write-Host ('Baixando '+$name+'...')
        Invoke-WebRequest -UseBasicParsing -Uri $asset.browser_download_url -OutFile $target
    }
    if((Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash -ne $expected) {throw ('Falha de integridade: '+$name)}
    $verified+=,$target
}
if($verified.Count -eq 0) {throw 'Publicacao sem pacote.'}
$zip=Join-Path $downloads 'elyndor-alpha-windows.zip'
if($verified.Count -gt 1 -or $verified[0] -ne $zip) {
    $stream=[IO.File]::Open($zip,[IO.FileMode]::Create,[IO.FileAccess]::Write)
    try {
        foreach($part in ($verified | Sort-Object)) {
            $inputStream=[IO.File]::OpenRead($part)
            try {$inputStream.CopyTo($stream)} finally {$inputStream.Dispose()}
        }
    } finally {$stream.Dispose()}
}
# Windows 10/11 includes tar.exe, which supports ZIP64 and large cooked packages.
& tar.exe -xf $zip -C $install
if($LASTEXITCODE -ne 0) {throw 'Falha ao extrair o pacote.'}
# Configuracao publica do servidor: busca a versao mais recente no GitHub e usa a copia local do ZIP como alternativa.
$configUrl='https://raw.githubusercontent.com/Nammur/elyndor-alpha-client/main/servidor.json'
try {
    $raw=(Invoke-WebRequest -UseBasicParsing -Uri $configUrl -Headers @{'User-Agent'='ElyndorAlphaInstaller'}).Content
} catch {
    $local=Join-Path $PSScriptRoot 'servidor.json'
    if(-not(Test-Path -LiteralPath $local)) {throw 'Nao foi possivel obter servidor.json.'}
    $raw=Get-Content -Raw -LiteralPath $local
}
if($raw -is [byte[]]) {$raw=[Text.Encoding]::UTF8.GetString($raw)}
$server=$raw | ConvertFrom-Json
if(-not $server.Url -or -not $server.GameServer -or $server.CertificateSha256 -notmatch '^[A-Fa-f0-9]{64}$') {throw 'servidor.json invalido.'}
[IO.File]::WriteAllText((Join-Path $install 'servidor.json'),$raw)
Write-Host ('Instalado em: '+$install)
Write-Host 'Configuracao do servidor aplicada. Abra Iniciar.bat e entre com a conta fornecida pelo anfitriao.'
Start-Process -FilePath explorer.exe -ArgumentList ('"'+$install+'"')
