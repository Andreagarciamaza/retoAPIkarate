Feature: Create users of the API in reqres.in

  Background:
    * url url
    * path "/api/users"
    * def responsecreateusers = read('classpath:../schemas/responseCreateUsers.json')

  @createUserSuccessful
  Scenario Outline: Create successful users flow
    Given request { "name": "<name>", "job": "<job>"}
    When method post
    Then status 201
    And print response
    * match response == responsecreateusers

    Examples:
      | name   | job     |
      | Erik   | leader  |
      | Andrea | doctor  |
      | Daniel | teacher |
