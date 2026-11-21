# Elyndor — alpha para Windows

Cliente para Windows 10/11 x64. Este repositorio publico distribui somente o jogo empacotado, a configuracao publica do servidor e as instrucoes para os jogadores.

**O servidor alpha esta no ar.** Para jogar voce precisa de uma conta criada pelo anfitriao.

## Baixar e instalar

1. Baixe este pequeno repositorio em **Code → Download ZIP** e extraia.
2. Abra **Baixar.bat**. Ele baixa a versao alpha mais recente, confere o SHA-256, extrai o jogo em `Games/ElyndorAlpha` dentro da sua pasta de usuario e ja coloca o `servidor.json` ao lado de **Iniciar.bat**.
3. Abra **Iniciar.bat** e entre com a conta fornecida pelo anfitriao.

Tambem e possivel baixar manualmente em [Releases](https://github.com/Nammur/elyndor-alpha-client/releases). Nesse caso, copie o [servidor.json](servidor.json) deste repositorio para a pasta do jogo, ao lado de **Iniciar.bat**. Se o ZIP estiver dividido em partes, use o instalador para reuni-las. Nao abra uma parte isolada como ZIP.

## Primeiro acesso

Se faltarem componentes Visual C++, execute `Windows/Engine/Extras/Redist/en-us/UEPrereqSetup_x64.exe` dentro da pasta extraida. O jogo precisa de placa de video compativel com os recursos do Unreal Engine 5; desempenho e requisitos serao avaliados neste alpha.

Nao e necessario instalar Unreal Engine, MySQL, .NET ou programa de tunel/VPN. O auxiliar de login vem no pacote.

## Conexao

| Servico | Endereco |
|---|---|
| Mundo | `147.185.221.217:57687` (UDP) |
| Login | `https://bore.pub:32159` (TCP, TLS com certificado fixado) |

As conexoes sao somente de saida. Os jogadores nao precisam abrir portas no roteador.

## Quando o endereco mudar

O endereco publico do login pode mudar se o tunel do anfitriao for reiniciado. Nesse caso o `servidor.json` deste repositorio sera atualizado. Abra **Baixar.bat** de novo: ele reaproveita o pacote ja baixado, se estiver integro, e aplica a configuracao nova.

## Configuracao e privacidade

`servidor.json` contem somente enderecos e a identificacao publica (SHA-256) do certificado do login. Nao edite o pin do certificado por conta propria. Nunca coloque senhas, chaves privadas ou arquivos do banco neste repositorio.

Este e um alpha em desenvolvimento. Relate falhas ao anfitriao com o que estava fazendo e, se possivel, um print.
