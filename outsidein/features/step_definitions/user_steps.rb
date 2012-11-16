Given /^I am not authenticated$/ do
  visit('/logout') #ensure logged out state
  page.should have_content "Please sign in"
end

Given /^the user "(.*?)" exists$/ do |username|
  case username
  when "bobby"
    user = User.new(id: 1, username: "bobby", email: "bobby@test.com", password: "abc")
  when "sally"
    user = User.new(id: 2, username: "sally", email: "sally@test.com", password: "123")
  end
  user.save
end

Given /^I am authenticated as "(.*?)"$/ do |username|
  case username
  when "bobby"
    password = "abc"
  when "sally"
    password = "123"
  end
  
  visit('/login')
  fill_in "username", :with => username
  fill_in "password", :with => password
  click_button "Login"
  page.should have_content "Logged in as #{username}"
end

Given /^I have gone through requesting password reset for "(.*?)"$/ do |username|
  visit('/login')
  click_link "Reset Password"
  fill_in "username", :with => username
  click_button "Reset Password"
end

When /^I go to the "(.*?)" page$/ do |page|
  case page
  when 'register'
    visit('/users/new')
  when 'login'
    visit('/login')
  end
end

When /^I go to the "(.*?)" for "(.*?)"$/ do |page, username|
  case page
  when 'account management page'
    visit edit_user_path(User.find_by_username(username))
  when 'profile page'
    visit user_path(User.find_by_username(username))
  end
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field_name, field_value|
  fill_in field_name, :with => field_value
end

When /^I press "(.*?)"$/ do |submit|
  click_button submit 
end

When /^I click the link "(.*?)"$/ do |link|
  click_link link
end

When /^I click on the reset password link in the email for "(.*?)"$/ do |username|
  user = User.find_by_username(username)
  visit(edit_password_reset_url(user.password_reset_token))
end


Then /^the user with "(.*?)" "(.*?)" should exist$/ do |fieldname, value|
  User.where(fieldname => value).first.should_not == []
end

Then /^I should see "(.*?)"$/ do |message|
  page.should have_content message
end

Then /^I should see a form prefilled with data about "(.*?)" on the page$/ do |username|
  user = User.find_by_username(username)
  page.should have_content user.id
  find_field('user_email').value.should eql user.email
  find_field('user_username').value.should eql user.username
end

Then /^I should see details about "(.*?)" on the page$/ do |username|
  user = User.find_by_username(username)
  page.should have_content user.id
  page.should have_content user.email
  page.should have_content user.username
  page.should have_content user.crypted_password
  page.should have_content user.salt
end

Then /^"(.*?)" should have "(.*?)" as "(.*?)"$/ do |username, value, fieldname|
  user = User.find_by_username(username)
  user.send(fieldname).should eql value
end

Then /^I should be authenticated as "(.*?)"$/ do |username|
  page.should have_content "Logged in as #{username}"
end

Then /^"(.*?)" should receive an email about password reset$/ do |username|
  user = User.find_by_username(username)

  email = ActionMailer::Base.deliveries.first
  email.from.should eql ["from@example.com"]
  email.to.should eql [user.email]
  email.body.should have_content "reset your password"
end

Then /^be able to login as "(.*?)" with "(.*?)"$/ do |username, password|
  visit('/login')
  fill_in "username", :with => username
  fill_in "password", :with => password
  click_button "Login"
  page.should have_content "Logged in as #{username}"
end
