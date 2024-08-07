Feature: MDT login page

  Background: 
    * def envConfig = call read('classpath:env.js')
    * configure driver = envConfig.driverConfig
    * def credentials = envConfig.Gate1
    * def environment = 'Gate1'
    * print environment

    # Log the environment variable
    * print 'Environment:', environment
    * karate.log('Environment in Background:', environment)
    
  @reg
  Scenario: Valid login credentials
    Given driver credentials.baseURL
    #* fullscreen()
    * maximize()
    * delay(5000)
    Then waitFor('input[id=username]')
    And input('input[id=username]', credentials.UserName)
    * delay(500)
    And input('input[id=organisation]', credentials.Organisation)
    * delay(500)
    And input('input[id=password]', credentials.Password)
    * delay(500)
    When click('button[type=submit]')
    * waitUntil("document.readyState == 'complete'")
    * delay(1000)
    
   #feature call based on env chosen
    * eval
      """
      if (environment == 'Contractorlogin') {
        karate.log('Calling features/Contractorlogin.feature');
        karate.callSingle('classpath:features/Contractorlogin.feature');
      } else {
        karate.log('Calling features/Client.feature');
        karate.callSingle('classpath:features/Client.feature');
      }
      """

  @invalid
  Scenario: Invalid login credentials
    Given driver baseUrl
    * delay(1000)
    And input('input[id=username]', 'Test')
    * delay(500)
    And input('input[id=organisation]', 'Tarento')
    * delay(500)
    And input('input[id=password]', 'Live@123')
    * delay(500)
    When click('button[type=submit]')
    * delay(2000)
    * dialog(true)
    * delay(2000)
