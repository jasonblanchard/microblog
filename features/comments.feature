Feature: Leave and view comments
    As a site viewer
    So that I can chime in
    I want to leave a comment

    Background:
        Given the following posts exist:
         | body          |
         | Hello world!  |
         | This is a post|

        Given the following comments exist:
            | body          | post          |
            | Great post!   | Hello world!  |
            | Stupid post   | This is a post|

    Scenario:
        When I go to the home page
        Then I should see "Great post!"
        And I should see "Stupid post"

    @javascript
    Scenario:
        When I go to the home page
        And I click on the "Comment" link
        And I fill in the "comment_body" form with "Lulz you cats"
        And I press "Create Comment"
        Then I should see "Lulz you cats"


