class TeamMembersController < ApplicationController
   
    before_action :authenticate_user!
    load_and_authorize_resource

	def index
		@team_members = current_user.is_admin? ? TeamMember.all : current_user.team_members
	end

	def new
		@team_member = TeamMember.new
	end

	def create
		@team_member = TeamMember.new(team_member_params)
		@team_member.user_id = current_user.id
		if @team_member.save
			#Notification.assign(@team_member, current_user).deliver!
			redirect_to team_members_path
		else
			render action: "new"
		end
	end

	def show
		begin
	    @team_member = current_user.team_members.find(params[:id])
	    rescue ActiveRecord::RecordNotFound
	    	redirect_to team_members_path, notice: "Record Not Found"
	    end
		@team = Team.new
		
	end

	def edit
		@team_member = current_user.team_members.find(params[:id])
	end

	def update
		@team_member = current_user.team_members.find(params[:id])
		@team_member.user_id = current_user.id
		if @team_member.update_attributes(team_member_params)
			redirect_to team_member_path(@team_member.id), notice: "successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@team_member = current_user.team_members.find(params[:id])
		@team_member.destroy
		redirect_to team_members_path, notice: "successfully deleted"
	end

	private
	def team_member_params
		params[:team_member].permit(:team_id, :user_id, task_ids: [] )
	end

end
