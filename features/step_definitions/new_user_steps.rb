# frozen_string_literal: true

Dado('que eu cliquei no botão para me cadastrar com um email válido') do
  visit '/'
  find('.login').click
  find('#email_create').set 'teste@teste.com.br'
  find('#SubmitCreate').click
end

Quando('eu preencho o formulário com meus {string}') do |_string|
end

Então('eu devo ser caapz de me logar no sistema') do
  pending # Write code here that turns the phrase above into concrete actions
end
