Bem Vindo ao Vagrant
===================

Neste tutorial estão as informações básicas para você começar a trabalhar com os sistemas rodando em seu computador, com uma máquina virtual semelhante ao utilizada em produção.

Instalações para Versionamento
-------------

Para começar a utilizar o GitLab, os seguintes programas precisam ser instalados:

#### GIT

- Acessar https://git-scm.com/download/win 
- Baixar a versão "64-bit Git for Windows Setup" e instalar

#### SouceTree
- Acessar https://www.sourcetreeapp.com/ 
- Baixar e instalar

Instalações para Virtualização
-------------

Para que você consiga rodar os sistemas versionados com as ferramentas acima em um ambiente virtual em sua máquina é necessário instalar os programas:

#### VirtualBox

- Acessar https://www.virtualbox.org/wiki/Downloads :
- Baixar "VirtualBox 5.1.26 platform packages -> Windows hosts" e instalar
- Baixar "VirtualBox 5.1.26 Oracle VM VirtualBox Extension Pack -> All supported platforms" e instalar

#### Vagrant

- Acessar https://www.vagrantup.com/downloads.html 
- Baixar versão para Windows e instalar

#### HostSwitcher

- Acessar  https://www.red-gate.com/simple-talk/wp-content/plugins/download-attachments/includes/download.php?id=58475
- Baixar e Instalar. Se o arquivo estiver sem extensão, coloque como .zip.
- Configurar HostSwitcher -> Clicar em "Open Host File" e adicionar os dados do arquivo hosts.txt que está versionado no repositório "vagrant"

> **Dica:** Se você usa o Chrome, baixe a extensão "Website IP" para você saber qual IP seu sistema está acessando no momento (desenvolvimento ou produção).

Organização de Pastas
-------------

No seu computador, dentro do D:\ as seguintes pastas existirão após o clone dos repositórios, conforme hierarquia abaixo:

 - dev
	 - [vagrant](http://gitlab.oderco.com.br/ti/vagrant)
	 - centos7-php56
		 - [salesforce](http://gitlab.oderco.com.br/ti/salesforce)
		 - [rma](http://gitlab.oderco.com.br/ti/rma)
		 - seguranca
		 - [services](http://gitlab.oderco.com.br/ti/services)
	 - centos7-php7
		 - [magento3](http://gitlab.oderco.com.br/ti/magento)

Você pode criar as pastas e clonar os repositórios conforme os links acima, ou utilizar os atalhos dentro de cada pasta de cada máquina que estão no repositório vagrant, os quais criarão as pastas e clonarão automaticamente os repositórios correspondentes de cada máquina.

Vamos Começar!
-------------

Primeiramente você precisará apenas criar a pasta D:\dev\vagrant e clonar o repositório utilizando o SourceTree (vide mais abaixo como fazer). Depois faça o seguinte:

#### Utilizando o HostSwitcher

Abra o HostSwitcher, clique com o botão direito do mouse e selecione "Open HOSTS file". No arquivo que abrir, copie e cole no final o conteúdo de D:\dev\vagrant\hosts.txt, salve e feche.

Ao clicar nele novamente, você verá os nomes dos sistemas os quais você poderá alternar para Development ou Production, bastando desse modo utilizar o mesmo DNS dos sistemas para acessá-los em ambos os ambientes.

#### Utilizando os Atalhos do Vagrant

Na barra de tarefas do Windows clique com o botão direito e vá em "Barra de ferramentas" e em "Nova barra de ferramentas...". Na tela que abrir selecione a pasta D:\dev\vagrant e clique em "Selecionar pasta". A pasta ficará de fácil acesso na barra de ferramentas.

Desse modo você poderá acessar os atalhos, clonar os repositórios e iniciar a máquina virtual.

> **Exemplo** (primeira vez):
Na pasta vagrant que está na barra de ferramentas, vá em "centos7-php56" e clique em "git-clone-all". Todas os repositórios pertencente à essa máquina serão clonados. Ao terminar, clique no atalho "up". Com isso a máquina virtual será iniciada. 
Clique no HostSwitcher ao lado do relógio da barra de tarefas, vá em RMA e clique em Development. Acesse http://rma.oderco.com.br/ e você estará acessando o RMA em sua máquina conectada em desenvolvimento.
Para usar o SourceTree, basta arrastar a pasta "rma" para dentro do programa (detalhes mais abaixo).

###### Lista de atalhos:

- **up**: Irá ligar a máquina virtual. Se for a primeira vez, ela será instalada.
- **halt**: Irá desligar a máquina virtual. Assegure-se sempre desligar sua máquina antes de desligar o computador para que não ocorra problemas.
- **reload**: Irá reiniciar sua máquina virtual.
- **destroy**: Irá destruir a máquina, removendo ela do VirtualBox.
- **full-provision**: Irá atualizar a Box do Vagrant, destruir a máquina e iniciar ela novamente. Utilizado quando existe atualização na Box, forçando o download dela novamente.
- **ssh**: Irá acessar a máquina via ssh.
- **git-clone-all**: Clonará todos os repositórios dos sistemas que rodam na respectiva máquina.
- **git-remove-all**: Removerá todos os repositórios da respectiva máquina. Você terá que excluir manualmente a referência (bookmarks) do repositório no SourceTree.

#### Utilizando o SourceTree

Após os repositórios estarem clonados pelos atalhos do Vagrant, você terá que adicioná-los ao SourceTree. Para isso abra o SourceTree, clique no sinal de "mais" (+). Na tela que aparecer (New tab) arraste as pastas que estão dentro de D:\dev\centos7-php7 e D:\dev\centos7-php56. 

Caso deseje clonar os repositórios sem utilizar o atalho do Vagrant, crie as pastas conforme mostrado na hierarquia acima. No SourceTree clique em + e depois em Clone. Coloque o endereço do repositório disponível no GitLab (exemplo: http://gitlab.oderco.com.br/ti/vagrant.git) em Source Path/ URL; Em Destination Path coloque selecione a pasta correta (exemplo D:\dev\vagrant); Clique em Clone.

> **Importante**: Ao clonar um repositório, a branch a ser utilizada será o "develop". Recomendamos a utilização do Git Flow para criar e finalizar branchs (features). Antes de finalizar sua feature (mesclar sua branch para a develop), SEMPRE entre primeiro na na develop, de um pull, entre na sua branch, mescle a develop para sua branch, só assim finalize pelo Git Flow ou mescle sua branch para a develop.
