@story-session_management
Feature: 
  In order to protect the integrity of the user session
  As a n application owner
  I want to verify that there are no weaknesses in the session management implementation
  
  Meta: @story session_management

  @cwe-664-fix @id-session_fixation
  Scenario: Issue a new session ID after authentication
    Given a new browser or client instance
    And the login page
    And the value of the session ID is noted
    When the default user logs in with default credentials
    And the user is logged in
    Then the value of the session cookie issued after authentication should be different from that of the previously noted session ID

  @cwe-613-logout @id-session_logout
  Scenario: Invalidate the session when the user logs out
    Given a new browser or client instance
    When the default user logs in with default credentials
    And the user is logged in
    When the user logs out
    Then the user is not logged in

  @asvs-2014-3.3 @id-session_inactive_timeout @skip
  Scenario: Invalidate the session after a period of inactivity
    Given a new browser or client instance
    When the default user logs in with default credentials
    And the user is logged in
    When the session is inactive for 15 minutes
    Then the user is not logged in

  @browser_only @cwe-614 @id-session_cookie_secure
  Scenario: Set the 'secure' flag on the session cookie
    Given a new browser or client instance
    When the default user logs in with default credentials
    And the user is logged in
    Then the session cookie should have the secure flag set

  @browser_only @id-session_cookie_httponly @wasc-13
  Scenario: Set the 'httpOnly' flag on the session cookie
    Given a new browser or client instance
    And the client/browser is configured to use an intercepting proxy
    When the default user logs in with default credentials
    And the user is logged in
    Then the session cookie should have the httpOnly flag set
