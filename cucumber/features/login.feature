Feature: Login

Scenario: Valid User
	Given a user with valid credentials
	When they log in 
	Then they will have access to secure portions of the site
	
Scenario: Invaild User
	Given a user with invalid credentials
  	When they log in
  	Then they will not gain access to secure portions of the site
	