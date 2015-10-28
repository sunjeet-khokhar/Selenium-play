#this test used the dynamic_page.rb page object
# objective of the is to detect whether a dynamic element got loaded or not ?

require 'selenium-webdriver'
require_relative 'dynamic_page'

describe 'Dynamic Loading' do
  
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @dynamic_loading = DynamicLoading.new(@driver)
  end
  
  after(:each) do
    @driver.quit
  end
  
  it 'Waited for Hidden Element' do
    @dynamic_loading.start
    @dynamic_loading.finish_text_present?.should be true
  end
end
