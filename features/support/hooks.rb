require 'watir-webdriver'



Before do
  @browser = Watir::Browser.new :firefox
end

After do
  visit(TodoPage).clear_list
  @browser.close
end
