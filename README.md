# Elyndor — alpha para Windows

Cliente para Windows 10/11 x64. Este repositorio publico distribui somente o jogo empacotado e as instrucoes para os jogadores.

**O servidor ainda esta em preparacao no notebook Linux.** O anfitriao fornecera o arquivo `servidor.json` e uma conta quando a conexao estiver pronta.

## Baixar e instalar

1. Baixe este pequeno repositorio em **Code → Download ZIP** e extraia.
2. Abra **Baixar.bat**. Ele baixa a versao alpha mais recente, confere o SHA-256 e extrai o jogo em `Jogos/ElyndorAlpha` dentro da sua pasta de usuario.
3. Coloque o `servidor.json` recebido do anfitriao na pasta indicada pelo instalador, ao lado de **Iniciar.bat**.
4. Abra **Iniciar.bat** e entre com a conta fornecida pelo anfitriao.

Tambem e possivel baixar manualmente em [Releases](https://github.com/Nammur/elyndor-alpha-client/releases). Se o ZIP estiver dividido em partes, use o instalador para reuni-las. Nao abra uma parte isolada como ZIP.

## Primeiro acesso

Se faltarem componentes Visual C++, execute `Windows/Engine/Extras/Redist/en-us/UEPrereqSetup_x64.exe` dentro da pasta extraida. O jogo precisa de placa de video compativel com os recursos do Unreal Engine 5; desempenho e requisitos serao avaliados neste alpha.

Nao e necessario instalar Unreal Engine, MySQL ou .NET. O auxiliar de login necessario vem no pacote. Uma nova configuracao de IP/dominio pode ser entregue como `servidor.json`, sem baixar o jogo outra vez.

O jogo conecta ao servidor em **7777/UDP** e ao login HTTPS em **17890/TCP**. Os jogadores nao precisam abrir portas de entrada no roteador.

## Configuracao e privacidade

`servidor.json` contem somente endereco e identificacao publica do certificado. Use apenas o arquivo fornecido pelo anfitriao. Nunca coloque senhas, chaves privadas ou arquivos do banco neste repositorio.

Este e um alpha em desenvolvimento. Relate falhas ao anfitriao com o que estava fazendo e, se possivel, um print.
