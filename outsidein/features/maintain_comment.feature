Feature: Comments
    In order to give feedback on application features
    As a User
    I want to be able to create comments

    Scenario: Comments can be added to article - User
        Given the user "sally" exists
        And I am authenticated as "sally"
        And the article "hi world" with the body of "some text" exists
        When I go to the "article page" for "hi world"
        And I fill in "comment_body" with "this is a comment"
        And I press "Add Comment"
        Then I should see "Comment added to Article"
        And I should see "Comment by sally"
        And I should see "this is a comment"
    
    Scenario: All comments can be viewed with article - Guest
        Given the article "hi world" with the body of "example article" exists
        And the comment "this is comment" for article "hi world" exists
        When I go to the "article page" for "hi world"
        Then I should see "this is comment"
