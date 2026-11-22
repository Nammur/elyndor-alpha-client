# Elyndor — alpha para Windows

Cliente para Windows 10/11 x64. Este repositorio publico distribui somente o launcher, o jogo empacotado (em Releases) e as instrucoes para os jogadores.

**O servidor ainda esta em preparacao no notebook Linux.** O anfitriao fornecera o arquivo `servidor.json` quando a conexao estiver pronta.

## Baixar, instalar e jogar

1. Baixe o **[ElyndorLauncher.exe](https://github.com/Nammur/elyndor-alpha-client/releases/latest/download/ElyndorLauncher.exe)** (menos de 1 MB) e abra.
2. Clique em **Baixar**. O launcher baixa a versao mais recente, confere o SHA-256 de cada parte e instala em `Games/ElyndorAlpha` dentro da sua pasta de usuario. Da para **Pausar** e **Retomar** sem perder o que ja baixou, inclusive depois de fechar o launcher.
3. Quando sair uma versao nova, o botao vira **Atualizar**. O `servidor.json` vai junto para a nova versao.
4. Na primeira vez, clique em **Servidor: escolher servidor.json** e escolha o arquivo recebido do anfitriao.
5. Entre com seu e-mail e senha (ou **Criar conta**) e clique em **Jogar**. O jogo abre direto na tela de carregamento do mundo.

O jogo so abre pelo launcher. A senha fica no launcher: o jogo recebe apenas uma entrada temporaria de uso unico.

O Windows pode mostrar o aviso do SmartScreen na primeira vez, porque o launcher ainda nao tem assinatura digital. Confira se o arquivo veio deste repositorio e clique em **Mais informacoes → Executar assim mesmo**.

## Primeiro acesso

Se faltarem componentes Visual C++, execute `Windows/Engine/Extras/Redist/en-us/UEPrereqSetup_x64.exe` dentro da pasta da versao instalada (botao **Abrir pasta do jogo**). O jogo precisa de placa de video compativel com os recursos do Unreal Engine 5; desempenho e requisitos serao avaliados neste alpha.

Nao e necessario instalar Unreal Engine, MySQL ou .NET: o launcher usa o .NET Framework 4.8 que ja vem no Windows 10/11.

O jogo conecta ao servidor em **7777/UDP** e ao login HTTPS em **17890/TCP**. Os jogadores nao precisam abrir portas de entrada no roteador.

## Configuracao e privacidade

`servidor.json` contem somente endereco e identificacao publica do certificado. Use apenas o arquivo fornecido pelo anfitriao. Nunca coloque senhas, chaves privadas ou arquivos do banco neste repositorio.

Este e um alpha em desenvolvimento. Relate falhas ao anfitriao com o que estava fazendo e, se possivel, um print.
