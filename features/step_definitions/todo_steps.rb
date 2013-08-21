Given(/^I want to view my TODO list$/) do
  visit TodoPage
end

When(/^I add a new item "(.*?)"$/) do |item|
  on(TodoPage).add_item item
end

Then(/^I should see a TODO item "(.*?)"$/) do |arg1|
  @current_page.todo_list.should include arg1
end
