
# 22/10/2015 A page object example for handling 
# a dynamic page through explicit waits 
class DynamicLoading
  
  # WONT WORK ---> WHY ??? START_BUTTON = {id: 'start'}
  #START_BUTTON  = { css: '#start button' }
  START_BUTTON = {tag_name: 'button'}
    
  FINISH_TEXT = {id: 'finish'}
  
  def initialize(driver)
    @driver = driver
    @driver.get "http://the-internet.herokuapp.com/dynamic_loading/1"
  end
  
  def start
    
    @driver.find_element(START_BUTTON).click
  end
  
  def finish_text_present?
    
    wait_for { is_displayed? FINISH_TEXT}
  end
  
  def is_displayed?(locator)
    @driver.find_element(locator).displayed?
    
  end
  
  def wait_for(timeout = 15)
    Selenium::WebDriver::Wait.new(:timeout => timeout).until{yield}
  end
end

  
  
  