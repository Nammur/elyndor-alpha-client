# Elyndor — alpha para Windows

Cliente para Windows 10/11 x64. Este repositorio publico distribui somente o launcher e o jogo empacotado (em Releases), a configuracao publica do servidor e as instrucoes para os jogadores.

**O servidor alpha esta no ar.**

## Baixar, instalar e jogar

1. Baixe o **[ElyndorLauncher.exe](https://github.com/Nammur/elyndor-alpha-client/releases/latest/download/ElyndorLauncher.exe)** (menos de 1 MB) e abra.
2. Clique em **Baixar**. O launcher baixa a versao mais recente, confere o SHA-256 de cada parte e instala em `Games/ElyndorAlpha` dentro da sua pasta de usuario. Da para **Pausar** e **Retomar** sem perder o que ja baixou, inclusive depois de fechar o launcher.
3. Entre com seu e-mail e senha (ou **Criar conta**) e clique em **Jogar**. O jogo abre direto na tela de carregamento do mundo.
4. Quando sair uma versao nova, o botao vira **Atualizar**.

O jogo so abre pelo launcher. A senha fica no launcher: o jogo recebe apenas uma entrada temporaria de uso unico.

O Windows pode mostrar o aviso do SmartScreen na primeira vez, porque o launcher ainda nao tem assinatura digital. Confira se o arquivo veio deste repositorio e clique em **Mais informacoes → Executar assim mesmo**.

## Primeiro acesso

Se faltarem componentes Visual C++, execute `Windows/Engine/Extras/Redist/en-us/UEPrereqSetup_x64.exe` dentro da pasta da versao instalada (botao **Abrir pasta do jogo**). O jogo precisa de placa de video compativel com os recursos do Unreal Engine 5; desempenho e requisitos serao avaliados neste alpha.

Nao e necessario instalar Unreal Engine, MySQL, .NET ou programa de tunel/VPN: o launcher usa o .NET Framework 4.8 que ja vem no Windows 10/11.

## Conexao

| Servico | Endereco |
|---|---|
| Mundo | `147.185.221.217:57687` (UDP) |
| Login | `https://bore.pub:5337` (TCP, TLS com certificado fixado) |

As conexoes sao somente de saida. Os jogadores nao precisam abrir portas no roteador.

## Quando o endereco mudar

O endereco publico do login pode mudar se o tunel do anfitriao for reiniciado. Nesse caso o [servidor.json](servidor.json) deste repositorio sera atualizado, e o launcher aplica a configuracao nova sozinho toda vez que abre. Basta fechar e abrir o launcher de novo.

## Configuracao e privacidade

`servidor.json` contem somente enderecos e a identificacao publica (SHA-256) do certificado do login. Nao edite o pin do certificado por conta propria. Nunca coloque senhas, chaves privadas ou arquivos do banco neste repositorio.

Este e um alpha em desenvolvimento. Relate falhas ao anfitriao com o que estava fazendo e, se possivel, um print.
