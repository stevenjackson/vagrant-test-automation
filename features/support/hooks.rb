require 'watir-webdriver'



Before do
  @browser = Watir::Browser.new :remote, :url => "http://192.168.88.1:4444/wd/hub"
end

After do
  visit(TodoPage).clear_list
  @browser.close
end
