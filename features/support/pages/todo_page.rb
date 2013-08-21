class TodoPage
  include PageObject

  page_url "http://localhost:9000"

  text_field(:new_item, :id => "label")
  button(:add, :text => "Create")

  def add_item(item)
    self.new_item = item
    add
  end

  def todo_list
    list_item_elements.map { |element| element.text }
  end

end
