Feature: Example Feature
    As a user I want to see a list of todos

    Scenario: Listing Todos
        Given the following todos:
            | title  | description   | done  |
            | Todo 1 | Description 1 | true  |
            | Todo 2 | Description 2 | false |
            | Todo 3 | Description 3 | true  |
        When I open "/my_todos"
        Then I should read the text "Todo 1"

