Given /^the article "(.*?)" with the body of "(.*?)" exists$/ do |title, body|
  @article = Article.new(title: title, body: body)
  @article.save
end

Given /^the comment "(.*?)" for article "(.*?)" exists$/ do |comment, article_name|
  article = Article.find_by_title(article_name)
  comment = Comment.new(body: comment, author_name: 'bob')
  comment.article_id = article.id
  comment.save
end

Then /^the article "(.*?)" should exist$/ do |title|
  Article.find_by_title(title).should_not == nil
end

Then /^the article "(.*?)" should have "(.*?)" as "(.*?)"$/ do |title, value, fieldname|
  article = Article.find_by_title(title)
  article.send(fieldname).should eql value
end

Then /^the article "(.*?)" should no longer exist$/ do |title|
  Article.find_by_title(title).should == nil
end
