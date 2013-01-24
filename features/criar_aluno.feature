# encoding: utf-8
# language: pt
Funcionalidade: Criar Aluno

  @javascript
  Cenário: Criar um novo Aluno
    Dado que eu estou no root
    Então eu clico no link Alunos
    Então eu clico no link New
    Então eu crio um novo aluno preenchendo todos os campos dos cadastro  
    Então entao devo visualizar