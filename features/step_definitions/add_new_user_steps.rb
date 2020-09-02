# frozen_string_literal: true

Dado('que eu cliquei no botão para me cadastrar com {string} válidos') do |dados|
  @user_data = @file[dados]
  @new_user.go
  @new_user.create_user(@user_data)
end

Quando('eu preencho o formulário com meus dados') do
  @new_user.fill_personal_information(@user_data)
  email = find('#email').value
  expect(email).to eql(@user_data['email'])

  @new_user.fill_address_information(@user_data)

  first_name = find('#firstname').value
  last_name = find('#lastname').value
  expect(first_name).to eql(@user_data['first_name'])
  expect(last_name).to eql(@user_data['last_name'])

  @new_user.submit_register
end

Então('eu devo ser caapz de me logar no sistema') do
  expect(@new_user.my_account).to have_text @user_data['expected_message']
end
