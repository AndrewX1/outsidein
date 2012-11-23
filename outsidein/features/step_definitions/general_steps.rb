When /^I go to the "(.*?)" page$/ do |page|
  case page
  when 'register'
    visit('/users/new')
  when 'login'
    visit('/login')
  when 'logout'
    visit('/logout')
  when 'user list'
    visit('/users')
  when 'create new article'
    visit('/articles/new')
  when 'article list'
    visit('/articles')
  end
end

When /^I go to the "(.*?)" for "(.*?)"$/ do |page, key|
  case page
  when 'account management page'
    visit edit_user_path(User.find_by_username(key))
  when 'profile page'
    visit user_path(User.find_by_username(key))
  when 'article page'
    visit article_path(Article.find_by_title(key))
  when 'update article page'
    visit edit_article_path(Article.find_by_title(key))
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

When /^I click on "(.*?)" for "(.*?)" with "(.*?)" of "(.*?)"$/ do |action, table, field, value|
  # get id
  result = ActiveRecord::Base.connection.select_all(
    "SELECT * FROM "+table+" WHERE "+field+" = '"+value+"'"
  )
  record = result.first

  click_link action + '-' + table.downcase + '-' + record['id'].to_s
end

Then /^I should see "(.*?)"$/ do |message|
  page.should have_content message
end

Then /^I should be redirected to "(.*?)"$/ do |page|
  case page
  when 'root'
    path = root_path
  end

  current_path.should == path
end
