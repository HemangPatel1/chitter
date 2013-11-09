When(/^I click on "Login"$/) do
	click_link 'Login'
end

Given(/^I complete the correct details$/) do
	fill_in('email', :with => 'hemang2@gmail.com')
	fill_in('password', :with => 'secret')
  click_button 'Login'
end
