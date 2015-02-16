class RenameColumnTodoItemsCompletedComplete < ActiveRecord::Migration
  def change
  	rename_column :todo_items, :completed, :complete
  end
end
