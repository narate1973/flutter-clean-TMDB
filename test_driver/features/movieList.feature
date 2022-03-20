Feature: Movie list
  Scenario: First open app
    Given "MyHomePage" appeared

    Then I should see "movieCardList" appeared

    When I tap the "MovieDropDown"

    Then I should see "MovieTypePopular" appeared

    Then I should see "MovieTypeNowShowing" appeared

    When I tap the "MovieTypeNowShowing"

    Then I should see "movieCardList" appeared