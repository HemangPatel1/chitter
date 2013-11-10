When(/^I click on "Sign Up"$/) do
	click_link 'Sign Up'
end

Given(/^I complete the form with matching passwords$/) do
	fill_in('name', :with => 'Hemang')
	fill_in('username', :with => 'Hemangle')
	fill_in('email', :with => 'hemang2@gmail.com')
	fill_in('password', :with => 'secret')
	fill_in('password_confirmation', :with => 'secret')
	click_button 'Sign Up'	
end

Given(/^I complete the form with passwords that do not match$/) do
	fill_in('name', :with => 'Hemang')
	fill_in('username', :with => 'Hemangle')	
	fill_in('email', :with => 'hemang2@gmail.com')
	fill_in('password', :with => 'secret')
	fill_in('password_confirmation', :with => 'notsecret')
	click_button 'Sign Up'	
end

