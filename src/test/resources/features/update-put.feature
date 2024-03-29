Feature: Update a user in the reqres.in API

  Background:
    * url url
    * def responsesingleuser = read('classpath:../schemas/responseSingleUser.json')

  @updateNameUser @updateUser @regression
  Scenario Outline:  User's name update
    * path "/api/users/2"
    Given request { "name": "<name>", "job": "<job>"}
    When method put
    Then status 200
    And print response
    And match $.name == "<name>"
    Examples:
      | name    | job           |
      | Nicolas | zion resident |
      | Andrea  | zion resident |
      | Daniel  | zion resident |

  @updateJobUser @updateUser @regression
  Scenario Outline: User's job update
    * path "/api/users/2"
    Given request { "name": "<name>", "job": "<job>"}
    When method put
    Then status 200
    And print response
    And match $.job == "<job>"
    Examples:
      | name    | job     |
      | Nicolas | leader  |
      | Andrea  | doctor  |
      | Daniel  | engineer |

  @updateUserInvalid @updateUser @regression
  Scenario: Update of the a user invalid
    * path "/api/users/2"
    Given request {}
    When method put
    Then status 200
    And print response

