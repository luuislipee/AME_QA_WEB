# frozen_string_literal: true
require 'report_builder'
require 'date'

Before do
  @new_user = NewUserPage.new
  @login = LoginPage.new

  @file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/dados.yaml'))
  page.current_window.resize_to(1920, 1080)
end

today_date = DateTime.now
@current_date = today_date.to_s.tr(':', '-')

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'log/report.json'
    config.report_path = "log/report_#{@current_date}"
    config.report_types = [:html]
    config.report_title = 'QA Challenge - WebApp'
    config.compress_image = true
    config.additional_info = { 'App': 'Web', 'Execution Date': @current_date }
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end