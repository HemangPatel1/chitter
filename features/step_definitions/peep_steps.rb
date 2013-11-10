Given(/^I have shared the following peeps:$/) do |peeps|
	peeps.hashes.each do |peep|
    	fill_in(:message, :with => peep['message'])
		click_button 'Share'
  	end
end


Then(/^I should see "(.*?)" before "(.*?)"$/) do |message, message2|
  first_position = page.body.index(message)
  second_position = page.body.index(message2)
  first_position.should < second_position  
end