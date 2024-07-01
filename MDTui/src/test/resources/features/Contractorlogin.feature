Feature: Contractor Login screen

  Background:
    * def readMonthIndexFile = 'file:target/monthIndex.json'
    * def writeMonthIndexFile = 'monthIndex.json'
    * def monthIndexData = karate.read(readMonthIndexFile) || { monthIndex: 0, lastAssignmentNumber: null }
    * karate.log('Initial Month Index Data:', monthIndexData)
    * karate.configure('retry', { count: 5, interval: 3000 })

  Scenario Outline: User Timesheet
    * delay(3000)
    * mouse().move("//button[text()=' + Create Timesheet ']")
    * delay(2000)
    * mouse("//button[text()=' + Create Timesheet ']").click()
    * delay(2000)
    * waitFor("//kendo-combobox[@textfield='assignment_number']")
    * mouse().move("//kendo-combobox[@textfield='assignment_number']")
    * delay(1000)
    * mouse("//kendo-combobox[@textfield='assignment_number']").click()
    * delay(1000)
    
    # Assignment No
    * def assignmentNumber = text("//ul[@role='listbox']//li[@index='0']//span[@class='col-12'][1]").trim()
    * karate.log('Retrieved assignmentNumber:', assignmentNumber)
    * click("//li[@index='0']")
    
    # Get the month index from the data or set it to 0 if it doesn't exist
    * def monthIndex = monthIndexData.monthIndex || 0
    * def lastAssignmentNumber = monthIndexData.lastAssignmentNumber || null
    * karate.log('MonthIndex:', monthIndex)
    * karate.log('Last Assignment Number (initial):', lastAssignmentNumber)

    # Determine the next month index based on the last assignment number
    * def nextMonthIndex = (lastAssignmentNumber == assignmentNumber) ? monthIndex + 1 : 0
    * karate.log('Next Month Index (before loop):', nextMonthIndex)

    # Timesheet
    * def proceed = true
    * eval
      """
      while (proceed) {
          delay(3000)
          mouse().move("//kendo-combobox[@textfield='month_name']").click();
          delay(1000);
          click("//li[@index='" + nextMonthIndex + "']");
          delay(1000);
          mouse().move("//kendo-combobox[@textfield='week_name']").click();
          delay(1000);
          if (exists("//li[contains(@class,'k-list-item k-disabled')]")) {
              nextMonthIndex = nextMonthIndex + 1;
              karate.log('Incremented nextMonthIndex to:', nextMonthIndex);
          } else {
              click("//li[@index='0']");
              proceed = false;
          }
      }
      """
    
    # Update the month index data with the new month index and current assignment number
    * monthIndexData.monthIndex = nextMonthIndex
    * monthIndexData.lastAssignmentNumber = assignmentNumber
    * karate.log('Updated Month Index Data:', monthIndexData)

    # Write the updated month index data back to the JSON file
    * karate.write(monthIndexData, writeMonthIndexFile)

    # Validate the updated month index in the JSON file
    * def updatedMonthIndexData = karate.read(readMonthIndexFile)
    * def validatedMonthIndex = updatedMonthIndexData.monthIndex
    * match validatedMonthIndex == nextMonthIndex
    * karate.log('Validated Month Index:', validatedMonthIndex)
    
    # Fill in the timesheet and submit
    * mouse().move("//*[@id='hours'][1]").click()
    * delay(1000)
    * input("//*[@id='hours'][1]", '1')
    * mouse().move("//a[@title='Copy to all']").click()
    * delay(1000)
    * mouse().move("//button[text()=' Submit ']").click()

    # Introduce a delay between iterations
    * delay(3000)

  Examples:
    | dummy |
    | 1     |
    | 2     |
    | 3     |
    | 4     |
    | 5     |
    
   # Abort after the iterations are complete
    Scenario: Abort execution
    * karate.abort()