Feature: Viewing Peeps
	In order to share my love of bananas
	As a maker who has many banana related facts / stories ;) 
	I want to view the peeps I have posted

	Scenario: Viewing a peep
		Given I am on the homepage
		And I have shared the following peeps:
			| message												|
			| To banana, or not to banana, that is the question!	|
		Then I should see "To banana, or not to banana, that is the question!"
