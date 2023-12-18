Feature: Organizing a fight between two fighters

  As a user of the Road Fighter game
    I want to organize a fight between two fighters
    So that I can know the result of the fight


  Scenario: Tie by points between two fighters
    Given the game is ready for a new fight
    And there are two fighters in the database
    And the fighters "DIO" and "Jotaro" are chosen to fight
    When I trigger the fight
    Then both fighters should survive the fight
    And the HP of "DIO" should be reduced by 50 points
    And the HP of "Jotaro" should be reduced by 500 points
    And the result of the fight should be a "Tie by points"
    And no fighter should be removed from the database
