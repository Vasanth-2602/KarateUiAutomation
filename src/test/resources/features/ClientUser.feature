Feature: Clientuser screen

  Background:
  
    * def Clientusernames = call read('classpath:karate-config.js')
    * def Client = karate.get('ClientsfullName')
    * def clientUserNames = Clientusernames.clientUserName
    * def randomFirstName = Clientusernames.firstName
    * def randomSurname = karate.get('randomSurname')

    
    
  Scenario: ClientUser creation
    
    * click("//img[@title='Menu']")
    * delay(1000)
    * click("//p[text()='Client Users']")
    * delay(2000)
    * click("//button[normalize-space(text())='Create']")
    * delay(3000)
    * input("//input[@placeholder='Select Client']", Client, 50)
    * click("//li[@index='0']")
    * delay(2000)
    * input("//*[@id='firstname']", clientUserNames)
    * delay(2000)
    * input("//*[@id='surname']", randomSurname)
    * delay(2000)
    * input("//*[@id='email']", clientUserNames + randomSurname + '@testing.quartzbysapphire.com', 50)
    * delay(2000)
    * click("//*[@id='is_login_allowed']")
    * delay(4000)
    * mouse().move("//input[@placeholder='Select Roles']").click()
    * delay(3000)
    * click("//li[@index='0']")
    * click("//li[@index='1']")
    * delay(1000)
    * click("//button[@type='submit']")
    * delay(4000)
    * karate.callSingle('Supplier.feature')
    
    