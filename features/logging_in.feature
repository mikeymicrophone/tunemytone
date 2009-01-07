Feature: creating an account
  In order to save information for my use
  As a person
  I should be able to create an account

  Scenario: no one was logged in
		Given no one is logged in
		And he is at the login page
		When he follows 'sign up'
		And he enters these values:
			| user_login | user_email | user_password | user_password_confirmation |
			| barnard | b@email.com | password | password |
		And he presses 'Create'
		Then there should be a user called 'barnard'
		
	