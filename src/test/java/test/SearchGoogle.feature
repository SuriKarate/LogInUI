Feature: Login Validations
Background:

    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    * def site = 'https://www.google.com/'

  Scenario Outline: nrgxhome Report <lookingFor> and <IntentNumber>
    Given driver site
    And input("textarea[id='APjFqb']", '<lookingFor>')
    * delay(3000).screenshot()
    
    
    
        Examples:
 |lookingFor|IntentNumber|
 |Miname|1|
 |YourName|2|