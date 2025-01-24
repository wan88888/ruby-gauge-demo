require_relative '../pages/login_page'
require 'selenium-webdriver'

driver = nil
login_page = nil

before_suite do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--start-maximized')
  driver = Selenium::WebDriver.for :chrome, options: options
  login_page = LoginPage.new(driver)
end

after_suite do
  driver.quit unless driver.nil?
end

step 'Open login page' do
  login_page.visit
end

step 'Enter username <username>' do |username|
  login_page.username_field.send_keys(username)
end

step 'Enter password <password>' do |password|
  login_page.password_field.send_keys(password)
end

step 'Click login button' do
  login_page.login_button.click
end

step 'Verify successful login message' do
  success_text = login_page.success_message_text
  assert(success_text.include?('You logged into a secure area!'), 'Login was not successful')
end