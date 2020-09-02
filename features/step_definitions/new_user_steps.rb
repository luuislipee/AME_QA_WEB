# frozen_string_literal: true

Dado('que eu cliquei no botão para me cadastrar com {string} válidos') do |dados|
  file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/dados.yaml'))
  @user_data = file[dados]

  visit '/'
  find('.login').click
  find('#email_create').set(@user_data['email'])
  find('#SubmitCreate').click
end

Quando('eu preencho o formulário com meus dados') do
  find('#id_gender1').click
  find('#customer_firstname').set(@user_data['first_name'])
  find('#customer_lastname').set(@user_data['last_name'])
  email = find('#email').value
  expect(email).to eql(@user_data['email'])
  find('#passwd').set(@user_data['password'])
  Capybara.ignore_hidden_elements = false
  find('#days').select(@user_data['day_of_birth'])
  find('#months').select(@user_data['month_of_birth'])
  find('#years').select(@user_data['year_of_birth'])

  find('#years').send_keys :tab

  first_name = find('#firstname').value
  last_name = find('#lastname').value

  expect(first_name).to eql(@user_data['first_name'])
  expect(last_name).to eql(@user_data['last_name'])

  # find('#firstname').set(@user_data['first_name'])
  # find('#lastname').set(@user_data['last_name'])
  find('#address1').set(@user_data['address'])
  find('#city').set(@user_data['city'])
  find('#id_country').select(@user_data['country'])
  find('#id_state').select(@user_data['state'])
  find('#postcode').set(@user_data['postal_code'])
  find('#phone_mobile').set(@user_data['mobile_phone'])
  find('#alias').set(@user_data['address_alias'])

  find('#submitAccount').click

  my_account = find('.info-account').value
  expect(my_account).to have_text('Welcome to your account. Here you can manage all of your personal information and orders.')

  Capybara.ignore_hidden_elements = true

  sleep 3
end

Então('eu devo ser caapz de me logar no sistema') do
  pending # Write code here that turns the phrase above into concrete actions
end
