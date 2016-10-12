class TasksController < ApplicationController
    
    before_action :authenticate_user!
    load_and_authorize_resource

	def index
		@tasks = current_user.is_admin? ? Task.all : current_user.tasks
	end

	def new
		@task = Task.new
		@team_member = TeamMember.new

	end

	def create
		@task = current_user.tasks.create(task_params)
		@task.user_id = current_user.id
		if @task.save
		 Notification.assign(@task, current_user).deliver!
			redirect_to tasks_path, notice:"Successfully created task"
		#end
		else
			render action: "new"
		
		end
	end

	def show
		begin
		@task = current_user.tasks.find(params[:id])
	    rescue ActiveRecord::RecordNotFound
	    	redirect_to tasks_path, notice: "Record Not Found"
	    end
	end

	def edit
    	@task = current_user.tasks.find(params[:id])
    end

    def update
    	@task = current_user.tasks.find(params[:id])
    	@task.user_id = current_user.id
    	if @task.update_attributes(task_params)
    		redirect_to task_path(@task.id),notice: "Successfully updated"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@task = current_user.tasks.find(params[:id])
    	@task.destroy
    	redirect_to tasks_path,notice: "Successfully deleted"
    end

    def mark_as_complete
    	task = Task.find(params[:task_id])
    	task.update_attributes(is_completed: true)
    	Notification.assign(task, current_user).deliver!
    	redirect_to :back, notice: "successfully created the task"
    end


	private
	def task_params
		params[:task].permit(:title, :start_date, :due_date, :is_completed, :priority, :team_id, user_ids: [])
	end

end