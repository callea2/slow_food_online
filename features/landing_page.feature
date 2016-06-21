Feature: As a visitor
So that I can order food that I feel like eating
I would like to access a page that allows me to make a choice of different restaurants

Scenario:
  Given I am on the "home page"
  Then I should see "What do you feel like tonight?"

Scenario:
  Given I am on the "home page"
  Then I should see the "category" drop list
  When I select "American" from "category"
  Then I should see "You have selected American, show restaurants here"
