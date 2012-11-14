Given /^I am not authenticated$/ do
  visit('/users/sign_out') #ensure logged out state
end

Given /^the user with id "(.*?)" exists$/ do |userid|
  user = User.new(id: userid, username: "bobby", email: "bobby@test.com", password: "abc")
  user.save
end

When /^I go to the register page$/ do
  visit('/users/new')
end

When /^I go to the "(.*?)" for user with id "(.*?)"$/ do |page, userid|
  case page
  when 'account management page'
    visit edit_user_path(User.find(userid))
  when 'profile page'
    visit user_path(User.find(userid))
  end
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field_name, field_value|
  fill_in field_name, :with => field_value
end

When /^I press "(.*?)"$/ do |submit|
  click_button submit 
end

Then /^the user with "(.*?)" "(.*?)" should exist$/ do |fieldname, value|
  User.where(fieldname => value).first.should_not == []
end

Then /^I should see "(.*?)"$/ do |message|
  page.should have_content message
end

Then /^I should see a form prefilled with data about user with id "(.*?)" on the page$/ do |userid|
  user = User.find(userid)
  page.should have_content user.id
  find_field('user_email').value.should eql user.email
  find_field('user_username').value.should eql user.username
end

Then /^I should see details about user with id "(.*?)" on the page$/ do |userid|
  user = User.find(userid)
  page.should have_content user.id
  page.should have_content user.email
  page.should have_content user.username
  page.should have_content user.crypted_password
  page.should have_content user.salt
end

Then /^the user with id "(.*?)" should have "(.*?)" as "(.*?)"$/ do |userid, value, fieldname|
  user = User.find(userid)
  user.send(fieldname).should eql value
end

