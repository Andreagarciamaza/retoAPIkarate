Feature: User search in the API reqres.in

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



