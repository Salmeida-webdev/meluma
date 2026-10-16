# QA e lançamento

## Verificações executadas neste pacote

- JavaScript verificado com `node --check`.
- IDs únicos, textos alternativos e referências locais/âncoras verificados por análise estática.
- Links de contato conferidos para o WhatsApp informado: `+55 83 99873-9712`.
- Rodapé conferido com o crédito solicitado.
- Sete imagens WebP: desktop e celular têm enquadramentos próprios no hero e na cena atmosférica; proporções HTML conferidas com os arquivos. Imagens abaixo do hero carregam sob demanda.
- O preload do hero é separado por breakpoint, então o celular não precisa baixar a imagem de desktop.
- Proporções revisadas a partir do vídeo: hero móvel em 4:5 sem sobrepor o texto na foto; close-up em 4:5; cena atmosférica em 16:10 no desktop e 4:5 com foto própria no celular; cards de galeria em 3:4 e 3:2.
- O hero desktop, o close-up de design, a imagem de atmosfera e os dois cards da galeria agora usam molduras refinadas; cada área mantém a proporção da sua arte (3:2, 4:5, 16:10, 3:4 e 3:2), com raio, borda e sombra consistentes. Os cards da galeria também têm legenda editorial e elevação sutil.
- Fontes ficam no sistema; não há fontes externas, analytics ou bibliotecas de terceiros.
- Menu, seletor de paleta e revelações usam JavaScript pequeno; há foco visível e suporte a `prefers-reduced-motion`.

## Pendências para a conferência local

A revisão visual foi feita com base no vídeo enviado e nos arquivos de imagem. Este ambiente não contém um navegador Chromium, então não foi possível gerar screenshots do pacote alterado nem executar Lighthouse/PageSpeed. Antes de publicar:

1. Reabra a versão revisada em 390 px, 768 px e 1440 px; confirme que o hero, o detalhe, a atmosfera e os cards mostram o produto inteiro.
2. Teste navegação por teclado, menu móvel, seletor de paleta e abertura das perguntas frequentes.
3. Confirme que o WhatsApp abre o número correto e que as imagens carregam em hospedagem estática.
4. Depois de publicar num domínio definido, configure URL canônica e `og:image` absoluto, rode PageSpeed mobile/desktop e registre as pontuações daquele teste.

Não há coleta de dados nem formulário nesta versão. As imagens, marca e produto são conceituais.
