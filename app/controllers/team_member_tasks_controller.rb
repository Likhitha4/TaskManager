class TeamMemberTasksController < ApplicationController
   
   load_and_authorize_resource


   def index
		@team_member_tasks = TeamMemberTask.all
	end

	def new
		@team_member_task = TeamMemberTask.new

	end

	def create
		@team_member_task = TeamMemberTask.new(team_member_task_params)
		if @team_member_task.save
			redirect_to team_member_path(@team_member_task.team_member_id), notice: "successfully created"
        end
	end

	def show
		begin
	    @team_member_task = team_member_tasks.find(params[:id])
	    rescue ActiveRecord::RecordNotFound
	    	redirect_to team_member_tasks_path, notice: "Record Not Found"
	    end
		
	end

	def edit
		@team_member_tasks = team_member_tasks.find(params[:id])
	end

	def update
		@team_member_task = team_member_tasks.find(params[:id])
		if @team_member_task.update_attributes(team_member_task_params)
			redirect_to team_member_task_path(@team_member.id), notice: "successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@team_member_task = team_member_tasks.find(params[:id])
		@team_member_task.destroy
		redirect_to team_member_tasks_path, notice: "successfully deleted"
	end


	private
	def team_member_task_params
		params[:team_member_task].permit(:task_id, :team_member_id)
	end
end
