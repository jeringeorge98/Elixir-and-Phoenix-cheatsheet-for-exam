Feature: Organizing a race
    As a race organizer
    I want to select the top 3 racers for a race
    So that we can have a competitive event 

    Scenario: Organizing a race with top 3 racers
        Given Some racers in the database
        | speed | name   | racer_id| boost | risk | points |
        |  100   | John  | A1000   | 10    | 0.5  | 200    |
        |  300   | Jerin | A2000   | 5     | 0.7  | 250    |
        |  150   | James | A1500   | 15    | 0.6  | 100    |
        |  200   | Jacob | A2500   | 30    | 0.9  | 300    |
        And I have the following race information
            | distance  | minimum_risk  | min_points       | max_points |
            | Race1     | 0.6           |  210             | 500        |

        When I click on organize race
        Then I should see the message "Race1 has been computed"