Feature: Add post to microblog
    As a person
    So that I an spread my ideas
    I want to post to the microblog


    Scenario:
        Given I go to the home page
        And I fill in the new post form with "Hello, cucumber!"
        And I press "Create Post"
        Then I should see "Hello, cucumber!"
