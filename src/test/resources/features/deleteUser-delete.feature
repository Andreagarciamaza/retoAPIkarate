Feature: Delete a user in the reqres.in API

  Background:
    * url url

  @deleteUser @delete @regression
  Scenario: Delete a user
    * path "/api/users/2"
    When method delete
    Then status 204
    And print response
