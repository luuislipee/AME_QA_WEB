# frozen_string_literal: true

Dado('que eu sou um usuário previamente cadastrado') do
  @login.go
end

# --------------- login_successful ---------------------

Quando('eu coloco meus {string} no campo de login') do |dados|
  @user_data = @file[dados]
  @login.with(@user_data)
end

Então('eu devo ser logado no sistema') do
  expect(@login.my_account).to have_text @user_data['expected_message']
end

# --------------- login_unsuccessful ---------------------

Quando('eu coloco meus {string} incorretos no campo de login') do |dados|
  steps %(
    Quando eu coloco meus "#{dados}" no campo de login
  )
end

Então('não devo ser autenticado') do
  sleep 3
end

Então('devo ver uma mensagem de alerta') do
  expect(@login.alert).to have_text @user_data['alert']
end

# ------------------- login_blank -------------------

Quando('eu não coloco meus {string} no campo de login') do |dados|
  steps %(
    Quando eu coloco meus "#{dados}" no campo de login
  )
end
