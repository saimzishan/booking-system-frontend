Feature: Booking Sort

  Background: I as an all user should be able to see the website
    Given I go to the website
    And I am shown the login screen, with picture and signup button
    Given There exist 5 bookings

  @runThis
  Scenario: Given 1 verified Booking Officer, I should be able to sort by job ids
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Job'
    Then I should see the bookings in ascending order of Job
    When I click on table header 'Job'
    Then I should see the bookings in descending order of Job

  @runThis
  Scenario: Given 1 verified Booking Officer, I should be able to sort by booking status
    Given The booking has status 'green'
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Status'
    Then I should see the bookings in ascending order of Status
    When I click on table header 'Status'
    Then I should see the bookings in descending order of Status

  @runThis
  Scenario: Given 1 verified Booking Officer, 1 verified Interpreter exists, I should be able to sort by booking state
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
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
    When I click on table header 'State'
    Then I should see the bookings in ascending order of State
    When I click on table header 'State'
    Then I should see the bookings in descending order of State

  @runThis
  Scenario: Given 1 verified Booking Officer, I should be able to sort by date range
    Given One booking has start and end dates as first and last days of next week
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Date'
    Then I should see the bookings in descending order of Date
    When I click on table header 'Date'
    Then I should see the bookings in ascending order of Date

  @runThis
  Scenario: Given 1 verified Booking Officer, I should be able to sort by client first name when last name is same
    Given One booking has client name as 'John'
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Client'
    Then I should see the bookings in ascending order of Client
    When I click on table header 'Client'
    Then I should see the bookings in descending order of Client

  @runThis
  Scenario: Given 1 verified Booking Officer, I should be able to sort by client last name when first name is same
    Given One booking has client last name as 'Jacobs'
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Client'
    Then I should see the bookings in ascending order of Client
    When I click on table header 'Client'
    Then I should see the bookings in descending order of Client

  @runThis
  Scenario: Given 1 verified Booking Officer, I should be able to sort by suburb name
    Given One booking has suburb as 'Terabithia'
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Suburb'
    Then I should see the bookings in ascending order of Suburb
    When I click on table header 'Suburb'
    Then I should see the bookings in descending order of Suburb

  @runThis
  Scenario: Given 1 verified Booking Officer, 1 verified Interpreter, I should be able to sort by interpreter names
    Given One booking has interpreter first name as 'Dragana'
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Interpreter'
    Then I should see the bookings in descending order of Interpreter
    When I click on table header 'Interpreter'
    Then I should see the bookings in ascending order of Interpreter

  @runThis
  Scenario: As a Booking Officer, I can sort the bookings by Org column
    Given I have preloaded bookings with different org values
    And I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Org'
    Then I should see the bookings in ascending order of Org
    When I click on table header 'Org'
    Then I should see the bookings in descending order of Org

  @runThis
  Scenario: Given 1 verified Booking Officer, I should be able to sort by date in ascending order
    Given One booking has start and end dates as first and last days of next week
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Date'
    Then I should see the bookings in descending order of Date
    When I click on table header 'Date'
    Then I should see the bookings in ascending order of Date
    And I click on 'New Booking'
    And I click on Booking
    Then I am shown with 5 booking
    Then I should see the bookings in ascending order of Date

# ---------------------------------------- AUSLAN1-438 -> START ----------------------------------------
  @runThis
  Scenario: Given 1 verified Booking Officer, I should be able to sort by method
    Given The booking has method type 'VRI'
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Method'
    Then I should see the bookings in ascending order of Method
    When I click on table header 'Method'
    Then I should see the bookings in descending order of Method

  @runThis
  Scenario: Given 1 verified Booking Officer, I should be able to sort by service type
    Given The booking has service type 'Captioning'
    Given I exist as an Booking Officer
    And I sign in with valid Booking Officer credentials
    When I am on the bookings page
    Then I will be shown with bookings
    When I click on table header 'Service Type'
    Then I should see the bookings in ascending order of Service Type
    When I click on table header 'Service Type'
    Then I should see the bookings in descending order of Service Type

# ---------------------------------------- AUSLAN1-438 -> END ----------------------------------------
