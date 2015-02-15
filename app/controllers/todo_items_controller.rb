class TodoItemsController < ApplicationController
	before_action :find_todo_item, only:[:edit, :update, :destroy]

		def index
			@todo_item = TodoItem.new
			@all_todo_items = TodoItem.all
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
		
		private

		def find_todo_item
			@todo_item = TodoItem.find(params[:id])
		end

		def todo_item_params
			params.require(:todo_item).permit(:name, :complete)
		end
end
