=begin
An experimental ruby script where in I am learning how to use CSS selectors 
with Selenium
This script also shows use of an explicit wait  
=end


require_relative 'CSS_sel_exp_class'
 

def setup
  @driver = Selenium::WebDriver.for :firefox
  @sel = CSS_sel_exp_class.new(@driver)
end

def teardown
  @sel.destroy
end

def run
  setup
  yield
  teardown
end

run do
  #@driver.get 'http://auburn.craigslist.org/'
  
  #click the farm and garden link , using the link's css id 
  #@driver.find_element(css: 'a.gra').click
  
  #click the antiques link
  #@driver.find_element(css: 'a.ata').click

  # The get is in the class file now
  #@driver.get 'http://www.apple.com/itunes/?cid=OAS-US-DOMAINS-itunes.com'
  
  
 load = @sel.wait_for_element
  if load == true
    @sel.click_element
    puts 'element found'
  else
   puts 'element not found'
  end


end
