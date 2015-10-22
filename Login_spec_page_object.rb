class Login 
  
  LOGIN_FORM = {id: 'login'}
  USERNAME_INPUT = {id: 'username'}
  PASSWORD_INPUT = {id: 'password'}
  SUCESS_MESSAGE = {css: 'flash.success'}
  
  def initialize(driver)
    @driver = driver
    @driver.get 'http://the-internet.herokuapp.com/login'
  end
  
  def login_with(username,password)
    @driver.find_element(USERNAME_INPUT).send_keys(username)
    @driver.find_element(PASSWORD_INPUT).send_keys(password)
    @drover.find_element(LOGIN_FORM).submit
  end
  
  def success_message_present?
    
    @driver.find_element(SUCCESS_MESSAGE).displayed?
  end
  
end
