require 'watir-webdriver'

Before do
  @browser = browser
end

After do
  visit(TodoPage).clear_list
  @browser.close
end

def browser
  if ENV['REMOTE']
    browser = Watir::Browser.new :remote, :url => "http://192.168.88.1:4444/wd/hub"
    sleep 2
  elsif ENV['PHANTOM']
    browser = Watir::Browser.new :phantomjs
  else
    browser = Watir::Browser.new :firefox
  end
  browser
end
