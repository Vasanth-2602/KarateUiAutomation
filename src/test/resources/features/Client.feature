Feature: Client screen

  Background:
  
    * def Clientnames = call read('classpath:karate-config.js')
    * def ClientsfullName = Clientnames.clientName
    * def randomFirstName = Clientnames.firstName
    * def randomSurname = Clientnames.surname
    * def FullName = Clientnames.fullName

 
  Scenario: Client creation
  
  #Create Base Info tab
    * click("//img[@title='Menu']")
    * delay(1000)
    * click("//p[text()='Clients']")
    * delay(1000)
    * click("//button[normalize-space(text())='Create']")
    * delay(1000)
    * input("//*[@id='client_name']", ClientsfullName )
    * delay(1000)
    * input("//*[@id='addressline1']", 'United Kingdom')
    * delay(1000)
    * input("//*[@id='post_code']", 'Uk390239')
    * delay(1000)
    * input("//*[@id='sales_ledger_code']", '200')
    * delay(1000)
    * click("//button[@type='submit']")
    * delay(3000)
    
  #Billing contact tab
    * waitFor("//span[text()='Billing Contact']")
    * click("//span[text()='Billing Contact']")
    * delay(3000)
    * if (exists("//span[text()='Unsaved Data Warning']")) click("//button[@aria-label='Close']")
    * delay(5000)
    * input("//*[@id='name']", ClientsfullName)
    * delay(1000)
    * input("//*[@id='email']", 'Client' + randomFirstName + randomSurname + '@testing.quartzbysapphire.com', 50)
    * delay(1000)
    * click("//button[@type='submit']")
    * delay(3000)
    
  #Settings tab
    * waitFor("//span[text()='Settings']")
    * click("//span[text()='Settings']")
    * delay(3000)
    * if (exists("//span[text()='Unsaved Data Warning']")) click("//button[@aria-label='Close']")
    * delay(5000)
    * click("//*[@id='payment_option']//input")
    * click("//li[@index='1']")
    * delay(2000)
    * click("//button[@type='submit']")
    * delay(3000)
    
   #Location settings tab
    * waitFor("//span[text()='Location Settings']")
    * click("//span[text()='Location Settings']")
    * delay(3000)
    * if (exists("//span[text()='Unsaved Data Warning']")) click("//button[@aria-label='Close']")
    * delay(5000)
    * input("//*[@id='location0']", 'Manchester')
    * delay(2000)
    * click("//button[@type='submit']")
    * click("//button[text()=' View ']")
    * delay(500)
    * karate.callSingle('ClientUser.feature')
    
    
    