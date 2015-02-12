class TodoItemsController < ApplicationController

		def index
			@todo_item = TodoItem.new
		end

		def create
			@todo_item = TodoItem.create(params.require(:todo_item).permit(:name))
			redirect_to root_url
		end
end
