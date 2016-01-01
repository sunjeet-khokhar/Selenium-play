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
  @driver.find_element(id: 'form').submit
end

Then(/^they will have access to secure portions of the site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^a user with invalid credentials$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^they will not gain access to secure portions of the site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end