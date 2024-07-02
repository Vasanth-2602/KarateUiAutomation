#@reg
Feature: Remittance Screeen

  Background: 
    * click("//p[text()='Payment Remittance']")
    * click("//p[text()='Payment Remittance Batch List']")
    * delay(6000)
    #* def tags = karate.get('tags')
    
  #@reg
  Scenario: Create Payment Remittance batch
    * waitFor("//button[text()=' + Create ']")
    When mouse().move("//button[text()=' + Create ']").click()
    * waitFor("//*[@id='label']")
    * input("//*[@id='label']", 'Remittance Batch A')
    When mouse().move("//*[@id='document_date_create']").click()
    * delay(1000)
    * click("//button[text()=' Today ']")
    * delay(1000)
    When mouse().move("//*[@id='payment_date_create']").click()
    * delay(1000)
    * click("//button[text()=' Today ']")
    * delay(2000)
    * click("//button[text()=' Create Batch ']")
    * delay(3000)
    
    #Add timesheet to batch
    When mouse().move("//td[@aria-colindex='11']//img[@title='Timesheet List']")
    And delay(1000)
    And click("//td[@aria-colindex='11']//img[@title='Timesheet List']")
    * delay(2000)
    When click("//tr[@aria-rowindex='3']//input[@type='checkbox']")
    * delay(1000)
    When click("//button[text()=' Add to Batch ']")	
    
        
    #Update Batch
    And waitFor("//button[text()=' Update Batch ']")
    Then click("//button[text()=' Update Batch ']")
    * delay(3000)
    
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
    * delay(2000)
    * if (exists("//span[text()='Purchase Invoice Email Warning!']")) click("//button[@aria-label='Yes']")
    
    
    

    
    
    
    
