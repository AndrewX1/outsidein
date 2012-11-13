Given /^I am not authenticated$/ do
  visit('/users/sign_out') #ensure logged out state
end

When /^I go to the register page$/ do
  visit('/users/new')
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field_name, field_value|
  fill_in field_name, :with => field_value
end

When /^I press "(.*?)"$/ do |submit|
  click_button submit 
end

Then /^The user with "(.*?)" should exist$/ do |username|
  User.where(:username => username).should_not == nil
end

Then /^I should see "(.*?)"$/ do |message|
  page.should have_content message
end
