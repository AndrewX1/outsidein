Feature: Maintain User
    In order to access additional functionality
    As a Guest
    I want to be able to maintain a user account

    Scenario: Create a new Account
        Given I am not authenticated
        When I go to the "register" page
        And I fill in "user_username" with "bobby"
        And I fill in "user_email" with "test@abc.com"
        And I fill in "user_password" with "abc"
        And I fill in "user_password_confirmation" with "abc"
        And I press "Create User"
        Then the user with "username" "bobby" should exist
        And I should see "User successfully created"

    Scenario Outline: Create a new Account - fail
        Given I am not authenticated
        When I go to the "register" page
        And I fill in "user_username" with <username>
        And I fill in "user_email" with <email>
        And I fill in "user_password" with <password>
        And I fill in "user_password_confirmation" with <password_confirm>
        And I press "Create User"
        Then I should see <error_message>

        Examples:
            | username | email          | password  | password_confirm | error_message              |
            | ""       | "test@abc.com" | "abc"     | "abc"            | "Username cannot be empty" |
            | "bobby"  | ""             | "abc"     | "abc"            | "Email cannot be empty"    |
            | "bobby"  | "test@abc.com" | "abc1"    | "abc2"           | "Passwords should match"   |

    Scenario: View user account details - Owner
        Given the user "bobby" exists
        And I am authenticated as "bobby"
        When I go to the "account management page" for "bobby"
        Then I should see a form prefilled with data about "bobby" on the page

    Scenario: View user account details - Another User
        Given the user "bobby" exists
        And the user "sally" exists
        And I am authenticated as "sally"
        When I go to the "account management page" for "bobby"
        Then I should see "You do not have permission to view this page"

    Scenario: Edit user account details
        Given the user "bobby" exists
        And I am authenticated as "bobby"
        When I go to the "account management page" for "bobby"
        And I fill in "user_email" with "changed@new.com"
        And I fill in "user_username" with "sammy"
        And I press "Update User"
        Then the user "sammy" should have "changed@new.com" as "email"
        And the user "sammy" should have "sammy" as "username"
        And I should see "User successfully updated"

    Scenario: View user profile page
        Given the user "bobby" exists
        When I go to the "profile page" for "bobby"
        Then I should see details about "bobby" on the page
