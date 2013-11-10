Feature: Viewing Peeps
	In order to learn more about bananas from other markers
	As a maker who has many banana related facts / stories ;) 
	I want to view the peeps all the makers have posted

	Scenario: Posting a peep if signed in
		Given I am signed in
		And I have shared the following peeps:
			| message												|
			| To banana, or not to banana, that is the question!	|
		Then I should see "To banana, or not to banana, that is the question!"

	Scenario: Viewing a peep if not signed in
		Given I am on the homepage
		And I should see "Sign Up"
		And I should see "Login"
		Then I should see "Peeps by other makers"

	Scenario: Peeps must have the name and username of the maker who shared it
		Given I am signed in
		And I have shared the following peeps:
			| message			| name		| username	|
			| Banana-ing it up!	| Hemang	| Hemangle	|
		Then I should see "Banana-ing it up!"
		And I should see "Hemang"
		And I should see "Hemangle"