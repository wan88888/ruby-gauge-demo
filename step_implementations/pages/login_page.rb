require 'selenium-webdriver'

class LoginPage
  def initialize(driver)
    @driver = driver
  end

  # Page elements
  def username_field
    @driver.find_element(id: 'username')
  end

  def password_field
    @driver.find_element(id: 'password')
  end

  def login_button
    @driver.find_element(css: 'button[type="submit"]')
  end

  def success_message
    @driver.find_element(css: '.flash.success')
  end

  # Page actions
  def visit
    @driver.get('http://the-internet.herokuapp.com/login')
  end

  def login(username, password)
    username_field.send_keys(username)
    password_field.send_keys(password)
    login_button.click
  end

  def success_message_text
    success_message.text
  end
end