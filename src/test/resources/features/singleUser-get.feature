Feature: Get a single user in the reqres.in API

  Background:
    * url url
    * def responsesingleuser = read('classpath:../schemas/responseSingleUser.json')

  @getSingleUser @getUser @regression
  Scenario: Get a single user
    * path "/api/users/2"
    When method get
    Then status 200
    And print response
    * match response == responsesingleuser

  @getSingleUserInvalid @getUser @regression
  Scenario: Get a single user with a user invalid
    * path "/api/users/10000000000000000000000000"
    When method get
    Then status 404
    And print response

  @getSingleUserwithLetters @getUser @regression
  Scenario: Get a single user with a user invalid with letters
    * path "/api/users/JKKKA"
    When method get
    Then status 404
    And print response


