Feature: Authentication

  As a registered user
  I want to login and out
  So that I can use the app

  Scenario: Unsuccessful signin
    Given I am on the signin page
    When I submit invalid signin information
    Then I should see an error message
      And I should see the signin form

  Scenario: Successful signin
    Given I am on the signin page
      And I am a registered user
    When I submit valid signin information
    Then I should get logged in

  Scenario: Successful signout
    Given I am currently logged in
    When I signout
    Then I should not be signed in anymore

  Scenario: Impossible signin
    Given I am currently logged in
    When I visit the signin page
    Then I should not see it

  Scenario: Session hijacking
    Given I am currently logged in
      And there is another user registered
    When I change the user id in the session cookie
    Then I should not be able to act as the other user