Feature: As all, I can login/logout, change profile, cannot login with invalid password (BR001/BR007)

  Background: As all i am on computer and on main website, before any steps
    Given I am on a computer
    And I go to the website
    And I am shown the login screen, with picture and signup button
    And I exist as an valid user

  @runThis
  Scenario: As Administrator, I can login/logout
    And I sign in with valid Administrator credentials
    Then I will be shown the bookings page
    And I go to base url
    Then I can see the element with name 'auslanLogo' is 'hidden'

  @runThis
  Scenario: As Individual Client, I can login/logout
    And I sign in with valid Individual Client credentials
    Then I will be shown the bookings page
    And I click on my name
    And I click on logout
    Then I won't be logged in anymore and will be taken back to the loging screen

  @runThis
  Scenario: As Individual Client, I cannot login without valid password
    And I sign in with invalid Individual Client credentials
    Then I will get an error message saying "Email or password not found"

  @runThis
  Scenario: As Administrator, I can login/logout
    And I sign in with valid Administrator credentials
    Then I will be shown the bookings page
    And I click on my name
    And I click on logout
    Then I won't be logged in anymore and will be taken back to the loging screen

  @runThis
  Scenario: As Interpreter, I can login/logout
    And I sign in with valid Interpreter credentials
    Then I will be shown the bookings page
    And I click on my name
    And I click on logout
    Then I won't be logged in anymore and will be taken back to the loging screen

  @runThis
  Scenario: As Interpreter, I cannot login without valid password
    And I sign in with invalid Interpreter credentials
    Then I will get an error message saying "Email or password not found"


  @runThis
  Scenario: As Organisational Representative, I can login/logout
    And I sign in with valid Organisational Representative credentials
    Then I will be shown the bookings page
    And I click on my name
    And I click on logout
    Then I won't be logged in anymore and will be taken back to the loging screen

  @runThis
  Scenario: As Organisational Representative, I cannot login without valid password
    And I sign in with invalid Organisational Representative credentials
    Then I will get an error message saying "Email or password not found"

  @runThis
  Scenario: As Booking Officer, I can login/logout
    And I sign in with valid Booking Officer credentials
    Then I will be shown the bookings page
    And I click on my name
    And I click on logout
    Then I won't be logged in anymore and will be taken back to the loging screen


  @runThis
  Scenario: As Organisational Representative, I can reset my password with valid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter valid Organisational Representative email
    Then I press Submit
    Then I get a valid reset password notification

  @runThis
  Scenario: As Organisational Representative, I cannot reset my password with invalid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter invalid Organisational Representative email
    Then I press Submit
    Then I get an error reset password notification

  @runThis
  Scenario: As Individual Client, I can reset my password with valid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter valid Individual Client email
    Then I press Submit
    Then I get a valid reset password notification

  @runThis
  Scenario: As Individual Client, I cannot reset my password with invalid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter invalid Individual Client email
    Then I press Submit
    Then I get an error reset password notification

  @runThis
  Scenario: As Interpreter, I can reset my password with valid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter valid Interpreter email
    Then I press Submit
    Then I get a valid reset password notification

  @runThis
  Scenario: As Interpreter, I cannot reset my password with invalid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter invalid Interpreter email
    Then I press Submit
    Then I get an error reset password notification

  @runThis
  Scenario: As Administrator, I can reset my password with valid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter valid Administrator email
    Then I press Submit
    Then I get a valid reset password notification

  @runThis
  Scenario: As Administrator, I cannot reset my password with invalid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter invalid Administrator email
    Then I press Submit
    Then I get an error reset password notification

  @runThis
  Scenario: As Booking Officer, I can reset my password with valid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter valid Booking Officer email
    Then I press Submit
    Then I get a valid reset password notification

  @runThis
  Scenario: As Booking Officer, I cannot reset my password with invalid email
    And I click on forgot my password
    Then I am at reset password page
    Then I enter invalid Booking Officer email
    Then I press Submit
    Then I get an error reset password notification

  @runThis
  Scenario: As Booking Officer, I cannot login without valid password
    And I sign in with invalid Booking Officer credentials
    Then I will get an error message saying "Email or password not found"

  @runThis
  Scenario: As Administrator, I cannot login without valid password
    And I sign in with invalid Administrator credentials
    Then I will get an error message saying "Email or password not found"

