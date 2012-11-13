Feature: Maintain User
    In order to access additional functionality
    As a Guest
    I want to be able to maintain a user account

    Scenario: Create a new Account
        Given I am not authenticated
        When I go to the register page
        And I fill in "user_username" with "bobby"
        And I fill in "user_email" with "test@abc.com"
        And I fill in "user_password" with "abc"
        And I fill in "user_password_confirmation" with "abc"
        And I press "Create User"
        Then The user with "email" should exist
        And I should see "User successfully created"

    Scenario: Create a new Account - Empty Username
        Given I am not authenticated
        When I go to the register page
        And I fill in "user_username" with ""
        And I fill in "user_email" with "test@abc.com"
        And I fill in "user_password" with "abc"
        And I fill in "user_password_confirmation" with "abc"
        And I press "Create User"
        Then I should see "Username cannot be empty"

    Scenario: Create a new Account - Empty Email 
        Given I am not authenticated
        When I go to the register page
        And I fill in "user_username" with "bobby"
        And I fill in "user_email" with ""
        And I fill in "user_password" with "abc"
        And I fill in "user_password_confirmation" with "abc"
        And I press "Create User"
        Then I should see "Email cannot be empty"

    Scenario: Create a new Account - Password Match 
        Given I am not authenticated
        When I go to the register page
        And I fill in "user_username" with "bobby"
        And I fill in "user_email" with "test@abc.com"
        And I fill in "user_password" with "abc1"
        And I fill in "user_password_confirmation" with "abc2"
        And I press "Create User"
        Then I should see "Passwords should match"
