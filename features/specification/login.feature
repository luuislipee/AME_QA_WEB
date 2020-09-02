#language: pt

@login
Funcionalidade: Login
  Para que eu possa realizar compras na loja
  Eu devo estar logado
  Utilizando usuario e senha

  @login_successful
  Esquema do Cenario: Login Successful
    Dado que eu sou um usuário previamente cadastrado
    Quando eu coloco meus <dados> no campo de login
    Então eu devo ser logado no sistema

    Exemplos:
    |  dados  | 
    | "login" | 

  @login_unsuccessful
  Esquema do Cenario: Login Unsuccessful
    Dado que eu sou um usuário previamente cadastrado
    Quando eu coloco meus <dados> incorretos no campo de login
    Então não devo ser autenticado
    E devo ver uma mensagem de alerta
    
    Exemplos:
    |        dados         | 
    | "login_unsuccessful" | 

@login_blank
Esquema do Cenario: Login Blank
    Dado que eu sou um usuário previamente cadastrado
    Quando eu não coloco meus <dados> no campo de login
    Então não devo ser autenticado
    E devo ver uma mensagem de alerta
    
    Exemplos:
    |     dados     | 
    | "login_blank" | 