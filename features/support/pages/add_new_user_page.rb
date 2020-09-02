# frozen_string_literal: true

class NewUserPage
  include Capybara::DSL
  def go
    visit '/'
    find('.login').click
  end

  def create_user(user)
    find('#email_create').set user['email']
    find('#SubmitCreate').click

    update_data_file(user)
  end

  def update_data_file(data)
    data_file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/dados.yaml'))

    data_file['login']['email'] = data['email']
    data_file['login']['password'] = data['password']

    data_file['login_unsuccessful']['email'] = data['email']

    File.open(File.join(Dir.pwd, 'features/support/fixtures/dados.yaml'), 'w') { |f| f.write data_file.to_yaml }
  end

  def fill_personal_information(information)
    find('#id_gender1').click
    find('#customer_firstname').set(information['first_name'])
    find('#customer_lastname').set(information['last_name'])
    find('#passwd').set(information['password'])
    Capybara.ignore_hidden_elements = false
    find('#days').select(information['day_of_birth'])
    find('#months').select(information['month_of_birth'])
    find('#years').select(information['year_of_birth'])
    find('#years').send_keys :tab
  end

  def fill_address_information(address_info)
    find('#address1').set(address_info['address'])
    find('#city').set(address_info['city'])
    find('#id_country').select(address_info['country'])
    find('#id_state').select(address_info['state'])
    find('#postcode').set(address_info['postal_code'])
    find('#phone_mobile').set(address_info['mobile_phone'])
    find('#alias').set(address_info['address_alias'])
  end

  def submit_register
    find('#submitAccount').click
    Capybara.ignore_hidden_elements = true
  end

  def my_account
    find('.info-account').text
  end

  def alert
    find('.alert').text
  end
end
