# filename : login_spec.rb

# filename: login_spec.rb

# -- dont require this , as it is included in the helper file 
#require 'selenium-webdriver'  ---

require_relative 'spec_helper'
require_relative '../pages/Login'


describe 'Login_spec' do

  before(:each) do
    # -- dont need this as the initilzation is included in the spec_helper file now -- @driver = Selenium::WebDriver.for :firefox
    @login = Login.new(@driver)
  end

  #after(:each) do  --- dont need this as the initilzation is included in the spec_helper file now --
   # @driver.quit
  # end

  it 'succeeded' do
    
        #
    # @driver.get 'http://the-internet.herokuapp.com/login'
    # @driver.find_element(id: 'username').send_keys('tomsmith')
    # @driver.find_element(id: 'password').send_keys('SuperSecretPassword!')
    # @driver.find_element(id: 'login').submit
    # @driver.find_element(id: 'flash-messages').displayed?.should be true
    # @driver.find_element(css: '.flash.success').displayed?.should be true
    
    @login.login_with('tomsmith','SuperSecretPassword!')
    @login.success_message_present?.should be true
    
    

    end
    
    it 'failed' do
    
          #
      # @driver.get 'http://the-internet.herokuapp.com/login'
      # @driver.find_element(id: 'username').send_keys('tomsmith')
      # @driver.find_element(id: 'password').send_keys('SuperSecretPassword!')
      # @driver.find_element(id: 'login').submit
      # @driver.find_element(id: 'flash-messages').displayed?.should be true
      # @driver.find_element(css: '.flash.success').displayed?.should be true
    
      @login.login_with('fvfjf','SuperSe!')
      @login.failure_message_present?.should be true
    
    

      end

end




