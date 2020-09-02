# frozen_string_literal: true

Before do
  @new_user = NewUserPage.new
  @login = LoginPage.new

  @file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/dados.yaml'))
  page.current_window.resize_to(1920, 1080)
end
