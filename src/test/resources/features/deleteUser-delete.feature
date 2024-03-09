Feature: Delete a user in the reqres.in API

  Background:
    * url url

  @deleteUser @delete @regression
  Scenario: Delete a user
    * path "/api/users/2"
    When method delete
    Then status 204
    And print response

  @deleteUserNumberInvalid @delete @regression
  Scenario: Delete a user with a number invalid
    * path "/api/users/10000000000000000000000000"
    When method delete
    Then status 204
    And print response

  @deleteUserwithLetters @delete @regression
  Scenario:  Delete a user with letters
    * path "/api/users/JKKKA"
    When method delete
    Then status 204
    And print response