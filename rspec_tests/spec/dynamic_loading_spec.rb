#this test used the dynamic_page.rb page object
# objective of the is to detect whether a dynamic element got loaded or not ?

require_relative 'spec_helper'
require_relative '../pages/dynamic_page'

describe 'Dynamic Loading' do
  
  before(:each) do
    # -- dont need this as the initilzation is included in the spec_helper file now -- @driver = Selenium::WebDriver.for :firefox
    @dynamic_loading = DynamicLoading.new(@driver)
  end
  
  #after(:each) do  --- dont need this as the initilzation is included in the spec_helper file now --
   # @driver.quit
  # end
  
  it 'Waited for Hidden Element' do
    @dynamic_loading.visit_example 1
    @dynamic_loading.start
    @dynamic_loading.finish_text_present?.should be true
  end
  
  it 'Waited for Element To Render' do
      @dynamic_loading.visit_example 2
      @dynamic_loading.start
      @dynamic_loading.finish_text_present?.should be true
    end
  
end
