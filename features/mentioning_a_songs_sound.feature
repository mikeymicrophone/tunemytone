Feature: mentioning a song's sound
  In order to discover all the nuances of rock music and learn how to play them all and more myself
  As a rocker
  I want to point out which parts of songs intrigue me
  
  Scenario: existing song
    Given the band Two Tongues
    And their song Don't You Want To Come Home
    When I go to the song page for Don't You Want To Come Home
    And I follow "mention sound"
    And I enter these values:
      | start | end |
      | 1:20 | 1:30 |
    And I press "save"
    Then there should be a sound starting at 1:20 and ending at 1:30 for Don't You Want To Come Home