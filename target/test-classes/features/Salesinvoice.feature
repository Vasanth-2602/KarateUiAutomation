#@reg
Feature: Sales Invoice Screeen

  Background: 
    
    * click("//p[text()='Sales Invoices']")
    * click("//p[text()='Sales Invoice Batch List']")
    * delay(3000)
    #* def tags = karate.get('tags')

  #@reg
  Scenario: Create Sale batch

    
    #Batch create
    * waitFor("//button[text()=' + Create ']")
    When mouse().move("//button[text()=' + Create ']").click()
    * waitFor("//*[@id='invoice_date']")
    * mouse().move("//*[@id='invoice_date']")
    * delay(1000)
    * mouse("//*[@id='invoice_date']").click()
    * delay(1000)
    * click("//button[text()=' Today ']")
    * delay(1000)
    * input("//*[@id='batch_label']", 'Sales Batch A')
    * delay(2000)
    * click("//button[text()=' Create Batch ']")
    * delay(3000)
    
    #Add timesheet to batch
    When mouse().move("//td[@aria-colindex='11']//img[@title='View']")
    And delay(1000)
    And click("//td[@aria-colindex='11']//img[@title='View']")
    * delay(2000)
    When click("//tr[@aria-rowindex='3']//input[@type='checkbox']")
    #When click("(//input[@aria-label='Select Row'])[3]")
    * delay(1000)
    When click("//button[text()=' Add to Batch ']")
    
    #Update Batch
    And waitFor("//button[text()=' Update Batch ']")
    Then click("//button[text()=' Update Batch ']")
    * delay(4000)
    #* maximize()
    
    #Run Batch
    When click("//td[@aria-colindex='12']//img[@title='Run Batch']")
    * if (exists("//span[text()='Run Batch!']")) click("//button[@aria-label='Yes']")
    * delay(6000)
    
    #PDF Download
    * click("//td[@aria-colindex='12']//img[@title='Pdf Bulk Download']")
    * delay(2000)
    * if (exists("//span[text()='Large PDF Download Warning!']")) click("//button[@aria-label='Yes']")
    * delay(6000)
    
    #Bulk email sent
    * click("//td[@aria-colindex='12']//img[@title='Send Email']")
    * delay(5000)
    * if (exists("//span[text()='Sales Invoice Email Warning!']")) click("//button[@aria-label='Yes']")
    And click("//img[@title='Menu']")
    * karate.callSingle('Remittance.feature')
     	
