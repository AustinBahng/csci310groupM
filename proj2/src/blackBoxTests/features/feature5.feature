Feature: Access to the application should be controlled by requiring a username and password
 
Background:
        Given that I am on the Login

Scenario: Check login button
        Then there should be a login button

Scenario: Check login redirect to Google
        When I click the login button
        Then I am redirected to the google sign in page