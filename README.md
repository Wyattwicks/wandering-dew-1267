# B2 Assessments

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.2.5

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd b2-mid-mod`
5. `bundle install`

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up (and not before), push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* How far you got through the user stories
  * Please include any user stories you partially complete, for example "completed user stories 1 and 2, really close to completing 3"
* A reflection on how you felt you did with this challenge

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Overview

In this assessment, students will build an application to track sporting competitions, the teams in those competitions, and the players on those teams.

* Each competition will have a name, location, and sport
    * for example, name: 'Men's Regional', location: 'Louisville', sport: 'basketball'
* Each team will have a hometown and a nickname
    * for example, hometown: 'Leesburg', nickname: 'Rockets'
* Each player will have a name and age
    * for example, name: 'Billy Bigshoes', age: 12
* Competitions have many teams
* Teams can be in many competitions
* Teams can have many players
* Players belong to a team

## User Stories

```
User Story 1 - Team Index

As a user
When I visit the Team Index
Then I see the name and hometown of all Teams
And under each team I see the names and ages of all its players
```

```
User Story 2 - Competition Show Page

As a user
When I visit a competition's show page
Then I see the competition's name, location, and sport
And I see the name and hometown of all teams in this competition
And I see the average age of all players in the competition
```

```
User Story 3 - Register a Team

As a user
When I visit a competition's show page
Then I see a text field to enter a team name
When I fill in this field with the name of an existing team
And I click the submit button
Then the team with the name that I submitted is associated with this competition
And I am redirected back to the competition's show page
And I see that the team is now listed among the other teams in the competition

(Note: you do not need to handle any sad paths, for example if the name entered does not match an existing team)
```

## Extension

```
Extension - Teams sorted by average player age

As a user
When I visit the team index
Then I see that all teams are sorted by their average player age from highest to lowest

(Note: you should only make 1 database query to retrieve the sorted list of teams)
```
