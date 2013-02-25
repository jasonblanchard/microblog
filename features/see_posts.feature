Feature: View posts on the microblog
    As a person
    So that I can see other peoples' ideas
    I want to be able to see microblog posts

    Background: posts in database

        Given the following posts exist:
        | body          |
        | Hello world! |
        | This is a post |

    Scenario:
        When I go to the home page
        Then I should see "This is a post"
        And I should see "Hello world!"

    Scenario:
        When I am on the show page for "Hello world!"
        Then I should see "Hello world!"

