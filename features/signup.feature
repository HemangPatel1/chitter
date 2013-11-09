Feature: Signing up
	In order to user chitter
	As a maker who wants to declare my love for bananas to other makers
	I want to sign up to the service

	Scenario: Signing up - clicking sign up link
	Given I am on the homepage
	When I click on "Sign Up"
	Then I should see "Please Sign Up!"

	Scenario: Signing up - filling out form
	Given I am on the sign up page
	And I complete the form
     #	And the two password fields match
	Then I should see "Welcome Hemang"
