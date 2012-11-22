Feature: Articles 
    In order to inform people about my activities and opinions
    As an Admin
    I want to maintain articles

    Scenario: Create article -Admin
        Given the user "bobby" exists
        And the user "bobby" is a "admin"
        And I am authenticated as "bobby"
        When I go to the "create new article" page
        And I fill in "article_title" with "hello world"
        And I fill in "article_body" with "a sample article"
        And I press "Create Article"
        Then I should see "Article was successfully created"
        And the article "hello world" should exist

    Scenario: Update article -Admin
        Given the user "bobby" exists
        And the user "bobby" is a "admin"
        And I am authenticated as "bobby"
        And the article "hello world" with the body of "This is a tutorial" exists
        When I go to the "update article page" for "hello world"
        And I fill in "article_title" with "hi world"
        And I fill in "article_body" with "This is a tutorial"
        And I press "Update Article"
        Then I should see "Article was successfully updated"
        And the article "hi world" should have "hi world" as "title"
        And the article "hi world" should have "This is a tutorial" as "body"

    Scenario: Delete article -Admin
        Given the user "bobby" exists
        And the user "bobby" is a "admin"
        And I am authenticated as "bobby"
        And the article "hi world" with the body of "This is a tutorial" exists
        When I go to the "article list" page
        And I click on "destroy" for "Articles" with "title" of "hi world"
        Then I should see "Article was successfully deleted"
        And the article "hi world" should no longer exist

    Scenario: Article list -User
        Given the user "sally" exists
        And I am authenticated as "sally"
        And the article "hi world" with the body of "This is a tutorial" exists
        When I go to the "article list" page
        Then I should see "hi world"

    Scenario: Article view -User
        Given the user "sally" exists
        And I am authenticated as "sally"
        And the article "hi world" with the body of "This is a tutorial" exists
        When I go to the "article page" for "hi world"
        Then I should see "hi world"
        And I should see "This is a tutorial"
