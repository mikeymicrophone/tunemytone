Feature: instrument creation
  In order to form preferences about instruments
  As a user
 	I should be able to save details about an instrument

	Scenario: creating an undetailed instrument
		Given a logged in user
		And he is at the instrument creation page
		When he fills in 'instrument_name' with 'Stratocaster'
		And he presses 'Create'
		Then there should be an instrument called 'Stratocaster'
		

