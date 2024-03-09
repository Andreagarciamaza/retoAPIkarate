Feature: Create users of the API in reqres.in

  Background:
    * url url
    * path "/api/users"
    * def responsecreateusers = read('classpath:../schemas/responseCreateUsers.json')

  @createUserSuccessful @createUsers @regression
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

  @createUserFailed @createUsers @regression
  Scenario: Create a user with invalid parameters
    Given request {}
    When method post
    Then status 201
    And print response

  @createUserFailedWithoutJob @createUsers @regression
  Scenario: Create a user without job
    And request { "name": "Daniela"}
    When method post
    Then status 201

  @createUserFailedNameInvalid @createUsers @regression
  Scenario: Create a user with a name invalid
    And request { "name": "$%&%", "job": "pilot" }
    When method post
    Then status 201
