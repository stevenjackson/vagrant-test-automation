class TodoPage
  include PageObject

  page_url "http://localhost:9000"

  text_field(:new_item, :id => "label")
  button(:add, :text => "Create")
  button(:complete_newest_item, :text =>"Delete", :index => 0)

  def add_item(item)
    self.new_item = item
    add
  end

  def todo_list
    list_item_elements.map { |element| element.text }
  end

  def clear_list
    until button_elements(:text => "Delete").empty? do
      button_element(:text => "Delete").click
    end
  end
end
