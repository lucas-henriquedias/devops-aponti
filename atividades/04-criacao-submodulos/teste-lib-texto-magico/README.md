# texto-magico-cli

App de terminal em Python que consome a biblioteca Texto_magico
(desenvolvida por um colega da turma), trazida como git submodule.

## Como clonar (traz o submodulo junto)

```bash
git clone --recurse-submodules https://github.com/lucas-henriquedias/texto-magico-cli.git
cd texto-magico-cli
```

Se ja tiver clonado sem essa flag:

```bash
git submodule update --init --recursive
```

## Como rodar

```bash
py main.py
```

## Menu

```
1) Inverter texto
2) Gritar texto
0) Sair
```

## Como a biblioteca foi adicionada

```bash
git submodule add https://github.com/ph95583faculdade-maker/Texto_magico.git libs/texto_magico
```

## Creditos

Biblioteca `Texto_magico` desenvolvida por Pedro Henrique (ph95583faculdade-maker) como
parte da atividade da aula 9.