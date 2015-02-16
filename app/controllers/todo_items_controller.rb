class TodoItemsController < ApplicationController
	before_action :find_todo_item, only:[:update, :destroy, :edit]

		def index
			@todo_item = TodoItem.new
			@all_todo_items = TodoItem.all
		  if params[:complete] == "true"
		    @all_todo_items = @all_todo_items.where(complete: true)	
		  elsif params[:complete] == "false"	
		  	@all_todo_items = @all_todo_items.where(complete: false)
		  end	
		end

		def create
			@todo_item = TodoItem.create(todo_item_params)
			redirect_to root_url
		end

		def update
			#@todo_item = TodoItem.find(params[:id])
			@todo_item.update(todo_item_params)
			redirect_to root_url
		end

		def edit
		end

		def destroy
			@todo_item.destroy
			redirect_to root_url
		end

		def clear_completed
			TodoItem.where(complete: true).update_all(complete: false)
			redirect_to root_url
		end
		
		private

		def find_todo_item
			@todo_item = TodoItem.find(params[:id])
		end

		def todo_item_params
			params.require(:todo_item).permit(:name, :complete)
		end
end
