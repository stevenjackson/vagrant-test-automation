Feature:  Add and complete TODO list items
  As a busy person
  I want to track my TODO list items
  So I don't forget them

Scenario:  Add a TODO list item
  Given I want to view my TODO list
  When I add a new item "Write slides for Cukeup talk"
  Then I should see "Write slides for Cukeup talk"
