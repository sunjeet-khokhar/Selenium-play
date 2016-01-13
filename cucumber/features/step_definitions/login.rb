Given(/^a user with valid credentials$/) do
  # Write code here that turns the phrase above into concrete actions
  @user = {
    username: 'tomsmith',
    password: 'SuperSecretPassword!'
  }
end

When(/^they log in$/) do
  # Write code here that turns the phrase above into concrete actions
  @driver.get 'http://the-internet.herokuapp.com/login'
  @driver.find_element(id: 'username').send_keys(@user[:username])
  @driver.find_element(id: 'password').send_keys(@user[:password])
  @driver.find_element(id: 'login').submit
end

Then(/^they will have access to secure portions of the site$/) do
   # Write code here that turns the phrase above into concrete actions
# when the check window method is clalled the first time , in the cucumber output it is 
# going to ask you to go the applitools web site and accept the baseline image, subsequent test 
# runs will use that image as a baseline and will throw an error if a difference is detected
@eyes.check_window('Logged In')
expect(@driver.find_element(css: '.flash.success').displayed?).to eql true
@eyes.close
end

Given(/^a user with invalid credentials$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^they will not gain access to secure portions of the site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end