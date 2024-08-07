#@reg
Feature: Assignment screen

  Background: 
    * click("//p[text()='Assignments']")
    * karate.log('Clicked on Assignments')
    * click("//p[text()='Create Assignment']")
    * delay(500)
    * def ContractorFullName = karate.get('ContfullName')
    * def ClientAssignment = karate.get('ClientsfullName')


  #@reg
  Scenario: Create Assignment
    # Client selection
    * waitFor("//input[@placeholder='Select Client']")
    Then input("//input[@placeholder='Select Client']", ClientAssignment,30)
    * delay(1000)
    And click("//li[@index='0']")
    * delay(1000)
    Then click("//*[@id='client_location']/button")
    * delay(1000)
    And click("//li[@index='0']")
    Then click("//*[@id='use_other_po']/span[1]")
    
    # Select today's date for Start Date
    * waitFor("//*[@id='ca_start_date']")
    When mouse().move("//*[@id='ca_start_date']").click()
    And click("//button[text()=' Today ']")
    
    # Select today's date for End Date
    * waitFor("//*[@id='ca_end_date']")
    When mouse().move("//*[@id='ca_end_date']").click()
    And click("//button[text()=' Today ']")
    Then input("//input[@placeholder='Select Contractor']", ContractorFullName, 50)
    Then click("//li[@index='0']")
    
    # Select today's date for Timesheet Start Date
    * mouse().move("//*[@id='timesheet_start_date']")
    * delay(5000)
    * mouse("//*[@id='timesheet_start_date']").click()
    * delay(1000)
    Then click("//button[text()=' Today ']")
    And click("//*[@id='timesheet_template']//input")
    Then click("//li[@index='0']")
    When click("//*[@id='pay_frequency']//input")
    And click("//li[@index='1']")
    And click("//button[@type='submit']")
    
    # PayCharge Rates Info tab
    And waitFor("//span[text()='PayCharge Rates Info']")
    And click("//span[text()='PayCharge Rates Info']")
    * delay(3000)
    * if (exists("//span[text()='Unsaved Data Warning']")) click("//button[@aria-label='Close']")
    * delay(5000)
    When mouse().move("//*[@id='rate_type_id']").click()
    * delay(1000)
    Then click("//li[@index='1']")
    When mouse().move("//*[@id='rate_types_template']").click()
    * delay(1000)
    Then click("//li[@index='1']")
    When input("//*[@id='pay_rate']", '125')
    And input("//*[@id='charge_rate']", '135')
    
    
    #exception handling case
    #When mouse().move("//button[text()=' Add ']").click()
    #* delay(3000)   
    #And mouse().move("(//*[@id='rate_type_id'])[2]").click();
    #* karate.abort()
    #And waitFor("//div[text()=' Rate Type is required ']")
    #And match text("//div[text()=' Rate Type is required ']") == 'Rate Type is required'
    #And mouse().move("(//kendo-combobox[@id='rate_types_template'])[2]").input('Testing').keyDown(Key.ENTER)
    #And waitFor("//div[text()=' Rate Units is required ']")
    #And match text("//div[text()=' Rate Units is required ']") == 'Rate Units is required'
    #And input("(//input[@id='pay_rate'])[2]", 'abc' + Key.ENTER)
    #And waitFor("//div[text()=' Pay Rate is required ']")
    #And match text("//div[text()=' Pay Rate is required ']") == 'Pay Rate is required'
    #And input("(//input[@id='charge_rate'])[2]", 'abc' + Key.ENTER)
    #And waitFor("//div[text()=' Charge Rate is required ']")
    #And match text("//div[text()=' Charge Rate is required ']") == 'Charge Rate is required'
    #And click("(//button[text()='Delete '])[2]")
    And delay(2000)
    And click("//button[@type='submit']")
    
    
    # Setting Info tab
    When waitFor("//span[text()='Settings Info']")
    Then click("//span[text()='Settings Info']")
    * delay(3000)
    * if (exists("//span[text()='Unsaved Data Warning']")) click("//button[@aria-label='Close']")
    When click("//*[@id='esignature']")
    Then waitFor("//*[@id='agency_authorization_required']")
    When click("//*[@id='agency_authorization_required']")
    And click("//button[@type='submit']")
    * delay(500)
    Then click("//button[text()=' View ']")
    * delay(500)
    And click("//img[@title='Menu']")
    * karate.callSingle('Timesheet.feature')
