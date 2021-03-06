Feature: Admin 
    In order to ensure proper use of the application
    As an Admin
    I want to be able to edit/remove accounts from the application

    Scenario: view list of accounts - Admin
        Given the user "bobby" exists
        And the user "sally" exists
        And the user "bobby" is a "admin"
        And I am authenticated as "bobby"
        When I go to the "user list" page
        Then I should see "sally"
        And I should see "bobby"
        And I should see "Show"
        And I should see "Edit"
        And I should see "Destroy"

    Scenario: Delete user account -Admin
        Given the user "bobby" exists
        And the user "bobby" is a "admin"
        And the user "sally" exists
        And I am authenticated as "bobby"
        When I go to the "user list" page
        And I click on "destroy" for "Users" with "username" of "sally"
        Then I should see "User successfully deleted"
        And the user "sally" should no longer exist

    Scenario: View user account details -Admin
        Given the user "bobby" exists
        And the user "sally" exists
        And the user "bobby" is a "admin"
        And I am authenticated as "bobby"
        When I go to the "account management page" for "sally"
        Then I should see a form prefilled with data about "sally" on the page

    Scenario: Edit user account details - Admin
        Given the user "bobby" exists
        And the user "sally" exists
        And the user "bobby" is a "admin"
        And I am authenticated as "bobby"
        When I go to the "account management page" for "sally"
        And I fill in "user_email" with "test@testing.com"
        And I fill in "user_username" with "david"
        And I press "Update User"
        Then the user "david" should have "test@testing.com" as "email"
        And the user "david" should have "david" as "username"
        And I should see "User successfully updated"

    Scenario: Remove user comments - Admin
        Given the user "bobby" exists
        And the user "bobby" is a "admin"
        And I am authenticated as "bobby"
        And the article "hi world" with the body of "some text" exists
        And the comment "this is comment" for article "hi world" exists
        When I go to the "article page" for "hi world"
        And I click on "destroy" for "Comments" with "body" of "this is comment"
        Then the comment "this is comment" should no longer exist
