Feature: Booking Admin Management

  Background: I as an ADMIN OR BOOKING OFFICER should be able to change booking status to unable to serve or cancel
    Given I am on a computer
    And I go to the website
    And I am shown the login screen, with picture and signup button

    ########### IN PROGRESS TO UNABLE TO SERVICE #######################################
  @runThis
  Scenario: Administrator can INPROGRESS to unable to service a booking, Interpreter exists and a booking is created
    Given I exist as an Administrator
    And I sign in with valid Administrator credentials
    And I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I can see the button 'Save' is disabled
    Then I select 1 Interpreter
    And I click on BUTTON name 'inviteBtn'
    Then I can see the button 'Save' is enabled
    And I click on BUTTON 'Save'
    Then I get a valid invite notification
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'In progress'
    Then I click on an individual booking of type 'In progress'
    Then I will be shown the booking job page
    Then I can see the booking state 'In Progress'
    Then I click on BUTTON 'Unable to Service'
    Then I will be shown a popup message
    Then I click on BUTTON name 'yesBtn'
    Then I get a valid 'Unable to Service' notification for state
    And I can not see a list of interpreters
    Then I can see the button state 'Unable to Service' is hidden
    Then I can see the button state 'Cancel Booking' is hidden
    Then I can see the booking state 'Unable to Service'
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'Unable to service'

  @runThis
  Scenario: Administrator cancel the INPROGRESS to unable to service action, Interpreter exists and a booking is created
    Given I exist as an Administrator
    And I sign in with valid Administrator credentials
    And I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I can see the button 'Save' is disabled
    Then I select 1 Interpreter
    And I click on BUTTON name 'inviteBtn'
    Then I can see the button 'Save' is enabled
    And I click on BUTTON 'Save'
    Then I get a valid invite notification
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'In progress'
    Then I click on an individual booking of type 'In progress'
    Then I will be shown the booking job page
    Then I can see the booking state 'In Progress'
    Then I click on BUTTON 'Unable to Service'
    Then I will be shown a popup message
    Then I click on BUTTON name 'noBtn'
    Then I can see the button 'Unable to Service' is enabled
    And I can see a list of 1 verified interpreters
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'In progress'


  @runThis
  Scenario: Booking Officer can INPROGRESS to unable to service a booking, Interpreter exists and a booking is created
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    And I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I can see the button 'Save' is disabled
    Then I select 1 Interpreter
    And I click on BUTTON name 'inviteBtn'
    Then I can see the button 'Save' is enabled
    And I click on BUTTON 'Save'
    Then I get a valid invite notification
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'In progress'
    Then I click on an individual booking of type 'In progress'
    Then I will be shown the booking job page
    Then I can see the booking state 'In Progress'
    Then I click on BUTTON 'Unable to Service'
    Then I will be shown a popup message
    Then I click on BUTTON name 'yesBtn'
    Then I get a valid 'Unable to Service' notification for state
    And I can not see a list of interpreters
    Then I can see the button state 'Unable to Service' is hidden
    Then I can see the button state 'Cancel Booking' is hidden
    Then I can see the booking state 'Unable to Service'
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'Unable to service'

  @runThis
  Scenario: Booking Officer cancel the INPROGRESS to unable to service action, Interpreter exists and a booking is created
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    And I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I can see the button 'Save' is disabled
    Then I select 1 Interpreter
    And I click on BUTTON name 'inviteBtn'
    Then I can see the button 'Save' is enabled
    And I click on BUTTON 'Save'
    Then I get a valid invite notification
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'In progress'
    Then I click on an individual booking of type 'In progress'
    Then I will be shown the booking job page
    Then I can see the booking state 'In Progress'
    Then I click on BUTTON 'Unable to Service'
    Then I will be shown a popup message
    Then I click on BUTTON name 'noBtn'
    Then I can see the button 'Unable to Service' is enabled
    And I can see a list of 1 verified interpreters
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'In progress'

    ########### REQUESTED TO UNABLE TO SERVICE #######################################

  @runThis
  Scenario: Administrator can REQUESTED to unable to service a booking, Interpreter exists and a booking is created and a booking is created
    Given I exist as an Administrator
    And I sign in with valid Administrator credentials
    And I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I click on BUTTON 'Unable to Service'
    Then I will be shown a popup message
    Then I click on BUTTON name 'yesBtn'
    Then I get a valid 'Unable to Service' notification for state
    And I can not see a list of interpreters
    Then I can see the button state 'Unable to Service' is hidden
    Then I can see the button state 'Cancel Booking' is hidden
    Then I can see the booking state 'Unable to Service'
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'Unable to service'

  @runThis
  Scenario: Administrator can cancel REQUESTED to the unable to service action, Interpreter exists and a booking is created
    Given I exist as an Administrator
    And I sign in with valid Administrator credentials
    And I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I click on BUTTON 'Unable to Service'
    Then I will be shown a popup message
    Then I click on BUTTON name 'noBtn'
    Then I can see the button 'Unable to Service' is enabled
    And I can see a list of 1 verified interpreters
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'Requested'


  @ignoreThis
  Scenario: Booking Officer can REQUESTED to the unable to service a booking, Interpreter exists and a booking is created
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    And I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I click on BUTTON 'Unable to Service'
    Then I will be shown a popup message
    Then I click on BUTTON name 'yesBtn'
    Then I get a valid 'Unable to Service' notification for state
    And I can not see a list of interpreters
    Then I can see the button state 'Unable to Service' is hidden
    Then I can see the button state 'Cancel Booking' is hidden
    Then I can see the booking state 'Unable to Service'
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'Unable to service'

  @runThis
  Scenario: Booking Officer cancel the REQUESTED to the unable to service action, Interpreter exists and a booking is created
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    And I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I click on BUTTON 'Unable to Service'
    Then I will be shown a popup message
    Then I click on BUTTON name 'noBtn'
    Then I can see the button 'Unable to Service' is enabled
    And I can see a list of 1 verified interpreters
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'Requested'

    ########### REQUESTED TO CANCEL #######################################

  @runThis
  Scenario: Administrator can the REQUESTED to Cancel Booking action, Interpreter exists and a booking is created
    Given I exist as an Administrator
    And I sign in with valid Administrator credentials
    Then I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I click on BUTTON 'Cancel Booking'
    Then I will be shown a popup message
    Then I click on BUTTON name 'yesBtn'
    Then I get a valid 'Cancelled with No Charge' notification for state
    And I can not see a list of interpreters
    Then I can see the button state 'Unable to Service' is hidden
    Then I can see the button state 'Cancel Booking' is hidden
    Then I can see the booking state 'Cancelled no charge'
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'Cancelled no charge'

  @runThis
  Scenario: Administrator cancel the REQUESTED to Cancel Booking action, Interpreter exists and a booking is created
    Given I exist as an Administrator
    And I sign in with valid Administrator credentials
    And I am on the bookings page
    Then I see one row with state 'Requested'
    Then I will be shown with bookings
    Then I click on an individual booking of type 'Requested'
    Then I will be shown the booking job page
    Then I click on BUTTON 'Cancel Booking'
    Then I will be shown a popup message
    Then I click on BUTTON name 'noBtn'
    Then I can see the button 'Cancel Booking' is enabled
    And I can see a list of 1 verified interpreters
    Then I click on Bookings
    And I am on the bookings page
    Then I see one row with state 'Requested'
