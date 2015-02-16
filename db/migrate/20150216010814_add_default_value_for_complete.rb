class AddDefaultValueForComplete < ActiveRecord::Migration
  def change
  	change_column_default :todo_items, :complete, false
  end
end
