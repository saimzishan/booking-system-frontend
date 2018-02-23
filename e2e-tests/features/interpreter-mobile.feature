Feature: As INTERPRETER, I can login on mobile

  Background: As INTERPRETER i am on mobile, before any steps
    Given I am on a mobile
    And I go to the website
    And I am on the mobile login screen without a hero picture

  @runThis
  Scenario: As Interpreter, I can login on mobile
    And I go to the website
    And I am shown the login screen, with picture and signup button
    And I exist as an Interpreter

  @runThis
  Scenario: As INTERPRETER, I can login on mobile
    And I sign in with valid Interpreter credentials
    Then I will be shown the bookings page

  @ignoreThis
  Scenario: As INTERPRETER and a booking is created and INTERPRETER can open the link directly even if previously logged out
    And I click on booking job detail page
    And I sign in with valid Interpreter credentials
    Then I will be shown the booking detail page with id 1

  @ignoreThis
  Scenario: As INTERPRETER, I can accept the booking, if a booking is created and INTERPRETER Invited then
    And I sign in with valid Interpreter credentials
    Then I will be shown the bookings page
    Then I see one row with state 'In progress'
    And  I click on an individual booking of type 'In progress'
    Then I can see the valid header in booking detail page
    Then I will be shown a valid booking detail page
    Then I can see the booking state ' IN_PROGRESS - Invited ' in booking detail page
    Then I click on button with css 'div.manage-job-buttons > button.button.button-accept'
    Then I will be shown a popup message
    Then I click on BUTTON name 'yesBtn'
    Then I wait for 3000 milli-seconds
    Then I can see the booking state ' ALLOCATED ' in booking detail page
    # Then I can see the button with css 'div.manage-job-buttons > button.button.button-accept.pushed' is visible
    Then I click on button with css 'button.icon-back'
    And I am on the bookings page
    Then I see one row with state 'Allocated'

    @runThis
  Scenario: As INTERPRETER, I can decline the booking, if a booking is created and INTERPRETER Invited then
    And I sign in with valid Interpreter credentials
    Then I will be shown the bookings page
    Then I see one row with state 'In progress'
    And  I click on an individual booking of type 'In progress'
    Then I can see the valid header in booking detail page
    Then I will be shown a valid booking detail page
    Then I can see the booking state ' IN_PROGRESS - Invited ' in booking detail page
    Then I click on button with css 'div.manage-job-buttons > button.button.button-decline'
    Then I will be shown a popup message
    Then I click on BUTTON name 'yesBtn'
    Then I wait for 3000 milli-seconds
    Then I can see the booking state ' IN_PROGRESS - Rejected ' in booking detail page
 # Then I can see the button with css 'div.manage-job-buttons > button.button.button-decline.pushed' is visible
    Then I click on button with css 'button.icon-back'
    And I am on the bookings page
    And  I click on an individual booking of type 'In progress'

  @runThis
  Scenario: As INTERPRETER, I can cancel the accept the booking action, if a booking is created and INTERPRETER Invited then
    And I sign in with valid Interpreter credentials
    Then I will be shown the bookings page
    Then I see one row with state 'In progress'
    And  I click on an individual booking of type 'In progress'
    Then I can see the valid header in booking detail page
    Then I will be shown a valid booking detail page
    Then I can see the booking state ' IN_PROGRESS - Invited ' in booking detail page
    Then I click on button with css 'div.manage-job-buttons > button.button.button-accept'
    Then I will be shown a popup message
    Then I click on BUTTON name 'noBtn'
    Then I can see the button with css 'button.button-accept' is enabled
    Then I can see the button with css 'button.button-decline' is enabled
    Then I click on button with css 'button.icon-back'
    And I am on the bookings page
    Then I see one row with state 'In progress'

  @runThis
  Scenario: As INTERPRETER, I can cancel booking, if a booking is created and INTERPRETER Invited then
    And I sign in with valid Interpreter credentials
    Then I will be shown the bookings page
    Then I see one row with state 'In progress'
    And  I click on an individual booking of type 'In progress'
    Then I can see the valid header in booking detail page
    Then I will be shown a valid booking detail page
    Then I can see the booking state ' IN_PROGRESS - Invited ' in booking detail page
    Then I click on button with css 'div.manage-job-buttons > button.button.button-decline'
    Then I will be shown a popup message
    Then I click on BUTTON name 'noBtn'
    Then I can see the button with css 'button.button-accept' is enabled
    Then I can see the button with css 'button.button-decline' is enabled
    Then I click on button with css 'button.icon-back'
    And I am on the bookings page
    Then I see one row with state 'In progress'

# ---------------------------------------- AUSLAN 1-67 -> START ----------------------------------------
  @runThis
  Scenario: As INTERPRETER, I can  accept the booking, if a booking is created and INTERPRETER Invited then
    And I sign in with valid Interpreter credentials
    And I will be shown the bookings page
    And I see one row with state 'In progress'
    And  I click on an individual booking of type 'In progress'
    And I can see the valid header in booking detail page
    And I will be shown a valid booking detail page
    And I can see the booking state ' IN_PROGRESS - Invited ' in booking detail page
    When I click on button with css 'div.manage-job-buttons > button.button.button-accept'
    And I will be shown a popup message
    And I click on BUTTON name 'yesBtn'
    Then I can verify the image of myself in the list of interpreter start with 'https://s3-ap-southeast-2.amazonaws.com/'

# ---------------------------------------- AUSLAN 1-67 -> END ----------------------------------------


# ---------------------------------------- AUSLAN 1-350 -> START ----------------------------------------
  @ignoreThis
  Scenario: As INTERPRETER, I can  accept the booking, if a booking is created and INTERPRETER Invited and Interpreter1 exists then
    And I sign in with valid Interpreter credentials
    And I will be shown the bookings page
    And I see one row with state 'In progress'
    And I click on an individual booking of type 'In progress'
    And I can see the valid header in booking detail page
    And I will be shown a valid booking detail page
    And I store the current url
    And I go to the website
    And I am on a computer
    And I am shown the login screen, with picture and signup button
    And I sign in with valid Interpreter1 credentials
    Then I will be shown the bookings page
    And I go to stored url
    Then I see the error page

  @ignoreThis
  Scenario: As INTERPRETER, I can  accept the booking, if a booking is created and INTERPRETER_ALL Invited and INTERPRETER1 exists then
    And I sign in with valid Interpreter credentials
    And I will be shown the bookings page
    And I see one row with state 'In progress'
    And  I click on an individual booking of type 'In progress'
    And I can see the valid header in booking detail page
    And I will be shown a valid booking detail page
    Then I can see the valid header in booking detail page
    Then I will be shown a valid booking detail page
    And I store the current url
    Then I can see the booking state ' IN_PROGRESS - Invited ' in booking detail page
    Then I click on button with css 'div.manage-job-buttons > button.button.button-decline'
    Then I will be shown a popup message
    And I click on BUTTON name 'yesBtn'
    Then I wait for 3000 milli-seconds
    Then I can see the booking state ' IN_PROGRESS - Rejected ' in booking detail page
    Then I click on button with css 'button.icon-back'
    And I am on the bookings page
    And I go to the website
    And I am on a computer
    And I am shown the login screen, with picture and signup button
    And I sign in with valid Interpreter1 credentials
    Then I will be shown the bookings page
    Then I see one row with state 'In progress'
    And  I click on an individual booking of type 'In progress'
    Then I can see the valid header in booking detail page
    Then I will be shown a valid booking detail page
    Then I can see the booking state ' IN_PROGRESS - Invited ' in booking detail page
    Then I click on button with css 'div.manage-job-buttons > button.button.button-accept'
    Then I will be shown a popup message
    And I click on BUTTON name 'yesBtn'
    Then I wait for 2500 milli-seconds
    Then I can see the booking state ' ALLOCATED ' in booking detail page
    And I go to the website
    And I am on a computer
    And I am shown the login screen, with picture and signup button
    And I sign in with valid Interpreter credentials
    Then I will be shown the bookings page
    And I go to stored url
    Then I will be shown the bookings page


  @ignoreThis
  Scenario: As INTERPRETER, I can  accept the booking, if a booking is created and INTERPRETER_ALL Invited and INTERPRETER1 exists then
    And I sign in with valid Interpreter credentials
    And I will be shown the bookings page
    And I see one row with state 'In progress'
    And  I click on an individual booking of type 'In progress'
    And I can see the valid header in booking detail page
    And I will be shown a valid booking detail page
    And I store the current url
    And I go to the website
    And I am on a computer
    And I am shown the login screen, with picture and signup button
    And I sign in with valid Interpreter1 credentials
    Then I will be shown the bookings page
    Then I see one row with state 'In progress'
    And  I click on an individual booking of type 'In progress'
    Then I can see the valid header in booking detail page
    Then I will be shown a valid booking detail page
    Then I can see the booking state ' IN_PROGRESS - Invited ' in booking detail page
    Then I click on button with css 'div.manage-job-buttons > button.button.button-accept'
    Then I will be shown a popup message
    And I click on BUTTON name 'yesBtn'
    Then I wait for 1000 milli-seconds
    Then I can see the booking state ' ALLOCATED ' in booking detail page
    And I go to the website
    And I am on a computer
    And I am shown the login screen, with picture and signup button
    And I sign in with valid Interpreter credentials
    Then I will be shown the bookings page
    And I go to stored url
    Then I will be shown the bookings page

# ---------------------------------------- AUSLAN 1-67 -> END ----------------------------------------
