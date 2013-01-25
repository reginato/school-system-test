# encoding: utf-8
# language: pt
Funcionalidade: Criar Turma

  @javascript
  Cenário: Criar um novo Turma
    Dado que eu estou no root
    Então eu clico no link Turmas
    Então eu clico no link New
    Então eu crio uma nova classe preenchendo todos os campos dos cadastro
    Então entao devo visualizar apos o cadatro
