Feature: MusicCollection

  As a registered and signed in user
  I want to create, view, update and delete albums
  So that I can manage and search my music collection

  Scenario: Create album
    Given I am currently logged in
      And I am on the album index page
    When I click add album
      And I create an album by "Rammstein" named "Herzeleid" from "1996"
    Then I should see an album by "Rammstein" named "Herzeleid" from "1996" on my album index page

  Scenario: Update album
    Given I am currently logged in
      And I have an album by "Rammstein" named "dielezreH" from "1996"
      And I am on the "dielezreH" album detail page
    When I change the title of the album to "Herzeleid"
    Then the album should have the new title "Herzeleid"

  Scenario: Delete album
    Given I am currently logged in
      And I have an album by "Rammstein" named "dielezreH" from "1996"
      And I am on the "dielezreH" album detail page
    When I delete the album
    Then the album "dielezreH" should not exist anymore

  Scenario: Search for an album
    Given I am currently logged in
      And I am on the album index page
      And I have an album by "Rammstein" named "Herzeleid" from "1996"
      And I have an album by "Rammstein" named "Sehnsucht" from "1998"
    When I search for the album named "Sehnsucht"
    Then I should see an album named "Sehnsucht" but not "Herzeleid"