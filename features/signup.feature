Feature: Signing up
	In order to use Chitter
	As a maker who wants to declare my love for bananas to other makers
	I want to sign up to the service

	Scenario: Signing up - clicking sign up link
	Given I am on the homepage
	When I click on "Sign Up"
	Then I should see "Please Sign Up!"

	Scenario: Signing up - filling out the form
	Given I am on the sign up page
	And I complete the form with matching passwords
	# Then I should see "Welcome Hemang" 

	Scenario: Signing up- filling out the form wrong
	Given I am on the sign up page
	And I complete the form with passwords that do not match
	Then I should see "Sorry, your passwords don't match!"
