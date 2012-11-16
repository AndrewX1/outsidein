Feature: Maintain User
    In order to access additional functionality
    As a Guest
    I want to be able to login to the application

    Scenario: Login to account
        Given I am not authenticated
        And the user "bobby" exists
        When I go to the "login" page
        And I fill in "username" with "bobby"
        And I fill in "password" with "abc"
        And I press "Login"
        Then I should be authenticated as "bobby"

    Scenario: Login persistence
        Given the user "bobby" exists
        And I am authenticated as "bobby"
        And I go to the "user" page
        Then I should be authenticated as "bobby"

    Scenario Outline: Login invalid
        Given I am not authenticated
        And the user <existing_username> exists
        When I go to the "login" page
        And I fill in "username" with <username>
        And I fill in "password" with <password>
        And I press "Login"
        Then I should see <error_message>

        Examples:
            | existing_username | username | password | error_message   |
            | "bobby"           | "bobby"  | "xyz"    | "Login failed"  |
            | "bobby"           | "bobby"  | ""       | "Login failed"  |
            | "bobby"           | ""       | ""       | "Login failed"  |
            | "bobby"           | "sally"  | "abc"    | "Login failed"  |

    Scenario: Reset password - link
        Given I am not authenticated
        When I go to the "login" page
        Then I should see "Reset Password"

    Scenario: Reset password - email
        Given I am not authenticated
        And the user "bobby" exists
        When I go to the "login" page
        And I click the link "Reset Password"
        And I fill in "username" with "bobby"
        And I press "Reset Password"
        Then "bobby" should receive an email about password reset

    Scenario: Reset password - reset
        Given the user "bobby" exists
        And I have gone through requesting password reset for "bobby"
        When I click on the reset password link in the email for "bobby"
        And I fill in "user_password" with "newpassword"
        And I fill in "user_password_confirmation" with "newpassword"
        And I press "Reset Password"
        Then I should see "Password has been reset!"
        And be able to login as "bobby" with "newpassword"
