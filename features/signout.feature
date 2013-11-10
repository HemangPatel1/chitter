Feature: Signing out
	In order to avoid other Makers not talking about bananas from my account
	As a maker who has an account
	I want to be able to sign out of the service

	Scenario: Signing out
	Given I am signed in
	And I should see "Welcome Hemang"
	When I click on "Log Out"
	Then I should not see "Welcome Hemang"
