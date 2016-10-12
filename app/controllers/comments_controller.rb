class CommentsController < ApplicationController
   before_action :authenticate_user!
   load_and_authorize_resource
	def index
		@comments = current_user.comments
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
		redirect_to comments_path, notice: "successfully created comment"
	    else 
	    	render action: "new"
	    end
	end

	def show
		begin
		@comment = current_user.comments.find(params[:id])
	    rescue ActiveRecord::RecordNotFound
	    	redirect_to comments_path, notice: "Record Not Found"
	    end
	end

	def edit
		@comment = current_user.comments.find(params[:id])
	end

	def update
		@comment = current_user.comments.find(params[:id])
		@comment.user_id = current_user.id
		if @comment.update_attributes(comment_params)
			redirect_to comment_path(@comment.id), notice: "successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@comment = current_user.comments.find(params[:id])
		@comment.destroy
		redirect_to comments_path, notice: "successfully deleted"
	end



	private
	def comment_params
		params[:comment].permit(:description, :task_id, :user_id, :attachment)
	end

end
