#language: pt

Funcionalidade: Register
  Sendo um novo usuário do sistema
  Eu devo ser capaz de me cadastrar
  Preenchendo o formulário

@new_user
Esquema do Cenario: New user
  Dado que eu cliquei no botão para me cadastrar com um email válido
  Quando eu preencho o formulário com meus <dados> 
  Então eu devo ser caapz de me logar no sistema

  Exemplos:
  |   dados    | 
  | "cadastro" | 