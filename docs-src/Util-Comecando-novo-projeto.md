# Começando novo projeto

!!! success "2020-2"
    Material atualizado.

!!! linux
    Usar o Linux fornecido!

!!! warning "Scrum Master"
    O grupo deve escolher um mediador
    
    ==Aconselhável no primeiro projeto o facilitador ser aquele que tem mais facilidade com linux e git.==

Você deve fazer a secção do seu papel: Mediador/ Desenvolvedor

## Antes de começar - Mediador

!!! note "Mediador"
    ==Somente mediador==, mas todos devem acompanhar (uma hora será sua vez).

Antes de começar será necessário atualizar o repositório de vocês com os novos arquivos no repositório oficial da disciplina, e também configurar o Travis para executar os testes nesse novo projeto. 

### upstream

!!! tip "Abrindo terminal no Linux"
    <kbd>ctrl</kbd>+<kbd>alt</kbd>+<kbd>t</kbd>

No terminal:

1. Referenciando repositório original da disciplina

``` bash
$ git remote add upstream https://github.com/insper/Z01.1
```

2. Atualizando repositório do grupo com alterações feitas no repositório da disciplina:

``` bash
$ git fetch upstream
$ git checkout master
$ git merge upstream/master
```

Feito isso deve ter aparecido uma nova pasta dentro do repositório de vocês: `Projetos/C-LogicaCombinacional/`.

### travis

!!! tip "Arquivos ocultos"
    No linux os arquivos que começam com `.` são ocultos, ou seja, eles não
    aparecem normalmente no gerenciador de arquivos ou no comando `ls`, para ver os arquivos ocultos:
    
    - No gerenciador de arquivos aperte <kbd>crtl</kbd>+<kbd>h</kbd> (*h de hide*)
    - `ls -a` (*onde -a indica all*)

Edite o arquivo `.travis.yml` localizado na raiz do repositório modificando o final do arquivo para ficar como:

``` yml
script:
   - python3 Projetos/A-AmbienteDesenvolvimento/testeAmbienteDesenvolvimento.py
   - python3 Projetos/B-LogicaCombinacional/testeLogicaCombinacional.py 
```

Agora vamos realizar um commit e submeter aos demais colegas do grupo as alterações:

```bash
$ git add .travis.yml
$ git commit -m "configurando travis para novo projeto"
```

### `SCRUM_MASTER.json`

O mediador do projeto deve editar o arquivo `SCRUM_MASTER.json` localizado na pasta do projeto (no caso do projeto B: `Projetos/B-LogicaCombinacional/SCRUM_MASTER.json`) com os seus dados.

Após editar esse arquivo deve realizar um commit e fazer o envio para o github:

```bash
$ git commit -am "configurado scrum do projeto"
$ git push origin master
```

!!! note
    Isso é importante pois os professores irão usar esse arquivo para saber quem são os mediadores de cada projeto.

### Atualizar tools

Você deve atualizar os scripts de teste, executando o comando a seguir:

```bash
$ ./updateZ01tools.sh
```

## Antes de começar - Desenvolvedores

!!! note "Desenvolvedores"
    Todos desenvolvedores devem fazer essa etapa.

!!! warning 
    Fazer isso somente depois que o mediador fez a parte dele!

Agora todos os integrantes do grupo devem atualizar o repositório local:

```
$ git pull origin master
```

## Atualizando Infra

!!! warning
    Todos devem realizar essa etapa: Mediadores e Desenvolvedores

Atualizar a infra da disciplina executando o comando a seguir:

```bash
$ ./updateZ01tools.sh
```

Isso irá baixar as dependências phython (via pip) e também clonar um repositório chamado `Z01-Tools` na raiz do usuário: `$HOME/Z01-Tools/`.
