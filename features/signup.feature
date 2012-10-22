Feature: Signing up

  As a visitor
  I want to create an account (sign up)
  So that I can sign in and use the app

  Scenario: Successful signup
    Given I am on the signup page
    When I submit valid signup information
    Then I should get logged in
      And I should see a success message

  Scenario Outline: Unsuccessful signup
    Given I am on the signup page
    When I submit invalid "<username>" and/or "<password>" and "<confirmation>"
    Then I should see an error message
      And I should see the signup form

    Scenarios: empty inputs
      | username | password | confirmation |
      |          |          |              |
      |          | 123456   |              |
      |          |          | 123456       |
      |          | 123456   | 123456       |
      | ABCD     |          |              |
      | ABCD     | 123456   |              |
      | ABCD     |          | 123456       |

    Scenarios: too short inputs
      | username | password | confirmation |
      | A        | 12345    | 12345        |
      | A        | 123456   | 123456       |
      | AB       | 12345    | 12345        |

    Scenarios: password and confirmation not matching
      | username | password | confirmation |
      | AB       | 123456   | 654321       |

  Scenario: Impossible signup
    Given I am currently logged in
    When I visit the signup page
    Then I should be able to see it