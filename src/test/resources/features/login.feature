Feature: MDT login page

  Background: 
    * def envConfig = call read('classpath:env.js')
    * configure driver = envConfig.driverConfig
    * def credentials = envConfig.Contractorlogin
    * def environment = credentials.environment

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
    #* eval
      #"""
      #if (environment == 'Contractorlogin') {
        #karate.log('Calling Contractorlogin.feature');
        #karate.call('classpath:Contractorlogin.feature');
      #} else {
        #karate.log('Calling Contractor.feature');
        #karate.call('classpath:Contractor.feature');
      #}
      #"""
#
  #* if (environment == 'Contractorlogin') karate.callSingle('Contractorlogin.feature')
  #* if (environment != 'Contractorlogin') karate.callSingle('Contractor.feature')
  * karate.callSingle('Contractorlogin.feature')
  #* karate.abort()
  
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
