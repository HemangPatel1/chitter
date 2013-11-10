Feature: Signing in
	In order to use Chitter
	As a maker who wants to declare my love for bananas to other makers
	I want to be able to sign in to the service

	Scenario: Signing in
		Given I am on the homepage
		When I click on "Login"
		Then I should see "Please Enter Your Details Below"

	Scenario: Signing in - inputing credentials
		Given I am on the sign in page
		And I complete the correct details
		# Then I should see "Welcome Hemang"
