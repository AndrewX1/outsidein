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
