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
        And I should see "edit"
        And I should see "delete"

    Scenario: Delete user account -Admin
        Given the user "bobby" exists
        And the user "bobby" is a "admin"
        And the user "sally" exists
        And I am authenticated as "bobby"
        When I go to the "user list" page
        And I click on "delete" for "sally"
        Then I should see "User successfully deleted"
        And the user "sally" should no longer exist

    Scenario: View user account details -Admin
        Given the user "bobby" exists
        And the user "sally" exists
        And the user "bobby" is an "admin"
        And I am authenticated as "bobby"
        When I go to the "account management page" for "sally"
        Then I should see a form prefilled with data about "sally"

    Scenario: Edit user account details - Admin
        Given the user "bobby" exists
        And the user "sally" exists
        And the user "bobby" is a "admin"
        And I am authenticated as "bobby"
        When I go to the "account management page" for "sally"
        And I fill in "user_email" with "test@testing.com"
        And I fill in "user_username" with "david"
        And I press "Update user"
        Then "david" should have "test@testing.com" as "email"
        And "david" should have "david" as "username"
        And I should see "User Succcessfully updated"
