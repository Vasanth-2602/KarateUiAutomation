#@reg
Feature: Timesheet screen

  Background: 
    # Test using side menu
    * click("//p[text()='User Timesheets']")
    * click("//p[text()='Create Manual Timesheet']")
    * delay(2000)
    * def ContractorName = karate.get('ContfullName')
    * def UploadfilePath = '../FileUploadTest/Dummy PDF.pdf'
    
  #@reg
  Scenario: Create Manual Timesheet
    When mouse().move("//*[@id='candidate_id']")
    * delay(2000)
    * mouse("//*[@id='candidate_id']").click()
    * input("//*[@id='candidate_id']", ContractorName)
    Then click("//li[@index='0']")
    * delay(2000)
    When mouse().move("//*[@id='assignment_id']").click()
    #* delay(2000)
    #And click("//li[@index='0']")
    * delay(3000)
    When mouse().move("//button[text()='Add Attachment(s)']").click()
    * delay(5000)
    * driver.inputFile('#k-fileselect-input-3', UploadfilePath)
    * delay(5000)
    And match driver.text("//div[text()='Dummy PDF.pdf']") == 'Dummy PDF.pdf'
    Then click("//button[@aria-label='Close']")
    * delay(2000)
    When mouse().move("//kendo-combobox[@textfield='rate_name']").click()
    And click("//li[@index='0']")
    * delay(1000)
    When mouse().move("//*[@id='hours']").click()
    * driver.script("document.getElementById('hours').value = '';") //To clear the exist value
    * input("#hours", "10")
    * delay(1000)
    * mouse().move("//button[text()=' Submit ']").click()
    * delay(4000)
    And click("//img[@title='Menu']")
    And eval karate.call('Salesinvoice.feature')
