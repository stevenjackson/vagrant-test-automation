Given(/^I want to view my TODO list$/) do
  visit TodoPage
end

When(/^I add a new item "(.*?)"$/) do |item|
  on(TodoPage).add_item item
end

Then(/^I should see a TODO item "(.*?)"$/) do |item|
  on(TodoPage).todo_list.should include item
end

Given(/^I have a TODO item for "(.*?)"$/) do |item|
  visit(TodoPage).add_item item
end

When(/^I complete the newest TODO$/) do
  on(TodoPage).complete_newest_item
end

Then(/^I should not see a TODO item "(.*?)"$/) do |item|
  on(TodoPage).todo_list.should_not include item
end
