Feature: Contractor screen

  Background:
  
    * def generateRandomHumanName = call read('classpath:karate-config.js')
    * def randomName = generateRandomHumanName
    * def randomFirstName = randomName.firstName
    * def randomSurname = randomName.surname
    * def ContfullName = randomName.fullName

  #@reg
  Scenario: Create and Complete Contractor Profile after login
    #* def driverState = karate.get('driver')  // Get the passed driver state
    Given click("//button[@type='button'][2]")
    And waitFor("//*[@id='title']/button")
    Then click("//*[@id='title']/button")
    And waitFor("//li[@index='0']")
    Then click("//li[@index='0']")
    And waitFor("//*[@id='first_name']")
    When input("//*[@id='first_name']", randomFirstName)
    And waitFor("//*[@id='surname']")
    Then input("//*[@id='surname']", randomSurname)
    And waitFor("//*[@id='gender']/button")
    Then click("//*[@id='gender']/button")
    And waitFor("//li[@index='0']")
    Then click("//li[@index='0']")
    And click("//*[@id='supplier']/kendo-combobox/button")
    Then click("//li[@index='0']")
    Then click("//button[@type='submit']")
    #* karate.abort()
    
    # Contact info tab
    And waitFor("//span[text()='Contact Info']")
    And click("//span[text()='Contact Info']")
    
    # Wait for email address input to be visible and input the email
    Then waitFor("//*[@id='email_address']")
    * delay(1000)
    And input("//*[@id='email_address']", randomFirstName + randomSurname + '@testing.mydigitalaccounts.com', 50)
    
    # Click the send invitation button
    And click("//*[@id='send_invitation']")
    Then click("//button[text()=' Save ']")
    * delay(500)
    
    # Payment info tab
    And waitFor("//span[text()='Payment Info']")
    And click("//span[text()='Payment Info']")
    * delay(500)
    
    # Wait for the page to load and input the bank details
    Then waitFor("//*[@id='bank_name']")
    * delay(500)
    And input("//*[@id='bank_name']", 'HDFC Bank')
    When input("//*[@id='account_name']", ContfullName)
    And input("//*[@id='account_number']", '99191877')
    Then input("//*[@id='sort_code']", '145698')
    And click("//button[text()=' Save ']")
    * delay(500)
    Then click("//button[text()=' View ']")
    * delay(500)
    And click("//img[@title='Menu']")
    #* karate.abort()
    * karate.callSingle('Assignment.feature')
    #* karate.abort()
