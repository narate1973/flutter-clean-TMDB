Feature: Movie detail
  Scenario: Select any movie to see detail
    Given "MyHomePage" appeared

    Then I should see "movieCardList" appeared

    Then I tap the label that contains the text "Action"

    Then I should see "MovieDetailPage" appeared

#    Then I swipe up by 1000 pixels on the "MovieDetailPage"
#
#    Then I should see "CastListTile" appeared