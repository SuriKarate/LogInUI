Feature: sample karate test script for dummies by Suriana Evagelista Nava
#This feature is an example  all the features going to be the same the tester Jr only edit the next lines.
#update de URL with the endpoint
#Update the uri with the swagger information
#update the requestBody with a happy Path information.
#update the met variable with the correct method from swagger.
  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def uri = 'users'
    * def met = 'post'
    * def Header =
      """
      {
        "Content-Type": "application/json"
      }
      """
    * def requestBody =
      """
      {
        "name": "Suriana Evangelista Nava",
        "username": "suriana.evangelista",
        "email": "suriana.evangelista@dominio.com",
        "address": {
          "street": "MiBarrio",
          "suite": "LaCoyotera",
          "city": "CdMx",
          "zipcode": "00000"
        }
      }
      """
      
      
#This section verify the the methods inly the correct method have status 200 the other
# are 404 mean not founded.
 @verifyMethods
 Scenario Outline: Verify the method <method> must be status <status>
    Given path uri
    And headers Header
    And request requestBody
    When method <method>
    Then status <status>
   Examples:
      | method         | status								|
      | get            | 404   								|
      | delete         | 404   								|
      | patch          | 404   								|
      | put            | 404   								|
      | post           | 201                  |
      | sen            | 404                  |
      
#This section remove one by one every  requestbody field and if the field is mandatory 
#the status must be 400 in othe case 200
 @MandatoryRequestFiedls
 Scenario Outline: Verify the Request field <field> mandatory <mandatory>
    Given path uri
    And headers Header
    And request requestBody
    And remove requestBody.<field>
    When method met
    Then status <status>
    Examples:
      | field          | mandatory | status  |
      | name           |     YES   | 400     |
      | username       |     NO    | 201     |
      | email          |     NO    | 201     |
      | address.street |     NO    | 201     |
      | address.suite  |     NO    | 201     |
      | address.city   |     NO    | 201     |
      | address.zipcode|     NO    | 201     |
      
#This section insert one by one in every  requestbody field  a long string to check the len field
 @lenRequest
 Scenario Outline: Verify the aceptation criteria  of the Request field  <field> mayor/minor/diferent to  <len>
    Given path uri
    And headers Header
    And request requestBody
    And set requestBody.<field> = <value>
    When method met
    Then status <status>
    Examples:
      | field          | len                 |value|status|
      | name           | 3 a 100 alfanumeric |SDFGHJJJ|201   |
      | username       |     100 alfanumeric |null|201   |
      | email          |     100 alfanumeric |value|201   |
      | address.street |     100 alfanumeric |value|201   |
      | address.suite  |     100 alfanumeric |value|201   |
      | address.city   |     100 alfanumeric |value|201   |
      | address.zipcode|     100 alfanumeric |value|201   |
      
 #######################################################################################################
 #This section is free and the tester JR of Suri's team must add all the tecnical design bussines rules# 
 #IMPORTANT : The next test cases must be obtained from tecnical design.                               #
 #######################################################################################################
 