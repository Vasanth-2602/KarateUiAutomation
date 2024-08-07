Feature: Supplier screen

  Background: 
    * def Supplier = call read('classpath:karate-config.js')
    * def supplierNames = Supplier.supplierName
    * def randomFirstName = Supplier.firstName
    * def randomSurname = Supplier.surname

  Scenario: Supplier creation
    #Base info tab
    * click("//img[@title='Menu']")
    * delay(1000)
    * click("//p[text()='Suppliers']")
    * delay(1000)
    * click("//button[normalize-space(text())='Create']")
    * delay(1000)
    * input("//*[@id='supplier_name']", supplierNames)
    * delay(1000)
    * input("//*[@id='supplier_code']", '200')
    * mouse().move("//*[@id='supplier_type']").click()
    * delay(1000)
    * click("//li[@index='1']")
    * delay(2000)
    * waitFor("//*[@id='effective_date']")
    * mouse().move("//*[@id='effective_date']").click()
    * delay(2000)
    * click("//button[text()=' Today ']")
    * click("//button[@type='submit']")
    * delay(3000)
    
    
    #Contact Details tab
    * waitFor("//span[text()='Contact Details']")
    * click("//span[text()='Contact Details']")
    * delay(3000)
    * if (exists("//span[text()='Unsaved Data Warning']")) click("//button[@aria-label='Close']")
    * delay(5000)
    * input("//*[@id='contact_name']", supplierNames)
    * delay(1000)
    * input("//*[@id='address_line1']", 'Manchester')
    * delay(1000)
    * input("//*[@id='post_code']", 'Uk900 1232')
    * delay(1000)
    * click("//button[@type='submit']")
    * delay(3000)
    
    
    #Payment Details tab
    * waitFor("//span[text()='Payment Details']")
    * click("//span[text()='Payment Details']")
    * delay(3000)
    * if (exists("//span[text()='Unsaved Data Warning']")) click("//button[@aria-label='Close']")
    * delay(5000)
    * input("//*[@id='bank_account_name']", supplierNames)
    * delay(2000)
    * input("//*[@id='bank_account_number']", '12345678')
    * delay(2000)
    * input("//*[@id='sort_code']", '12345678')
    * delay(2000)
    * click("//button[@type='submit']")
    * delay(3000)
    
    #Settings tab
    * waitFor("//span[text()='Settings']")
    * click("//span[text()='Settings']")
    * delay(3000)
    * if (exists("//span[text()='Unsaved Data Warning']")) click("//button[@aria-label='Close']")
    * delay(5000)
    * input("//*[@id='delivery_email']", 'Supplier' + randomFirstName + randomSurname + '@testing.quartzbysapphire.com', 50)
    * delay(2000)
    * click("//button[@type='submit']")
    * click("//button[text()=' View ']")
    * delay(500)
    * karate.callSingle('Contractor.feature')
    