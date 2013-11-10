Given(/^I have shared the following peeps:$/) do |peeps|
	peeps.hashes.each do |peep|
    	fill_in(:message, :with => peep['message'])
		click_button 'Share'
  	end
end


