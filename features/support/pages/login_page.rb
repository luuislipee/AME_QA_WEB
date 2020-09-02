# frozen_string_literal: true

class LoginPage
  include Capybara::DSL
  def go
    visit '/'
    find('.login').click
  end

  def with(credentials)
    find('#email').set(credentials['email'])
    find('#passwd').set(credentials['password'])
    find('#SubmitLogin').click
  end

  def alert
    find('.alert').text
  end

  def my_account
    find('.info-account').text
  end
end
