Given(/^I am signed in$/) do
	visit '/users/new'
	fill_in('name', :with => 'Hemang')
	fill_in('username', :with => 'Hemangle')	
	fill_in('email', :with => 'hemang2@gmail.com')
	fill_in('password', :with => 'secret')
	fill_in('password_confirmation', :with => 'secret')
  click_button 'Sign Up'
end

When(/^I click on "Log Out"$/) do
	click_button 'Log Out'
end
