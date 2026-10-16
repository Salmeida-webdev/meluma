# MELUMA — landing page conceitual

Página estática em HTML, CSS e JavaScript para apresentar uma marca fictícia e o conceito visual de uma luminária portátil. Não há loja, carrinho, checkout, preço, estoque, ficha técnica ou promessa de lançamento.

## Executar localmente

Depois de salvar o ZIP na pasta Downloads do Windows, rode este bloco no PowerShell. Ele extrai o projeto, inicia o servidor dentro da pasta correta e abre a página no navegador:

```powershell
$ProjectRoot = Join-Path $env:USERPROFILE "Downloads\MELUMA-landing-page"
$ZipPath = Join-Path $env:USERPROFILE "Downloads\MELUMA-landing-page-revisado.zip"

Expand-Archive -LiteralPath $ZipPath -DestinationPath $ProjectRoot -Force
Set-Location $ProjectRoot

$PythonLauncher = Get-Command py -ErrorAction SilentlyContinue
if (-not $PythonLauncher) {
    $PythonLauncher = Get-Command python -ErrorAction SilentlyContinue
}

if ($PythonLauncher) {
    $PortListener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Loopback, 0)
    $PortListener.Start()
    $Port = $PortListener.LocalEndpoint.Port
    $PortListener.Stop()

    Start-Process -FilePath $PythonLauncher.Source `
        -ArgumentList @("-m", "http.server", "$Port", "--bind", "127.0.0.1") `
        -WorkingDirectory $ProjectRoot

    $ServerReady = $false
    for ($Attempt = 0; $Attempt -lt 20 -and -not $ServerReady; $Attempt++) {
        try {
            $Response = Invoke-WebRequest "http://127.0.0.1:$Port" -UseBasicParsing -TimeoutSec 1
            $ServerReady = $Response.StatusCode -eq 200
        } catch {
            Start-Sleep -Milliseconds 250
        }
    }

    if ($ServerReady) {
        Start-Process "http://127.0.0.1:$Port"
    } else {
        throw "O servidor local não iniciou. Verifique se o Python está funcionando."
    }
} else {
    Start-Process (Join-Path $ProjectRoot "index.html")
}
```

Se Python não estiver instalado, o bloco abre `index.html` diretamente; as imagens, estilos e scripts continuam sendo carregados de suas subpastas.

## Estrutura

- `index.html`: conteúdo semântico, SEO básico, navegação e links.
- `styles.css`: identidade visual responsiva, estados de foco e movimento reduzido.
- `script.js`: menu móvel, paletas ilustrativas e revelações de rolagem sem bibliotecas.
- `public/brand/`: logos em SVG e PNG transparente.
- `public/images/`: imagens conceituais geradas para o projeto e otimizadas em WebP.
- `docs/ASSETS.md`: inventário, usos, textos alternativos e tamanhos de imagem.

## Personalizar e publicar

Confirme o número e a mensagem do WhatsApp antes de publicar. Defina uma URL canônica e transforme a referência Open Graph em uma URL absoluta quando o domínio estiver definido. O formulário e a captura de leads foram excluídos do briefing aprovado; o CTA de contato leva ao WhatsApp informado.

No Netlify, use publicação estática sem comando de build e diretório `.`. `netlify.toml` já registra essa configuração.

## Conceito e créditos

Marca, luminária e ambientes são fictícios e fazem parte de um exercício de portfólio. As imagens são generativas e não definem um produto disponível comercialmente.

Rodapé da página: “Desenvolvido por LMX Soluções Digitais/Segundo Almeida”.
