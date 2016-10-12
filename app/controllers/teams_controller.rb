class TeamsController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@teams = current_user.is_admin? ? Team.all : current_user.teams
	end
	
	def new
		@team = Team.new
		
	end
	def create
		@team = current_user.teams.new(team_params)
		@team.user_id = current_user.id
		if @team.save
			redirect_to teams_path, notice: "successfully created"
		else
			render action: "new"
		end
	end

	def show
		begin
		@team = current_user.teams.find(params[:id])
	    rescue ActiveRecord::RecordNotFound
	    	redirect_to teams_path, notice: "Record Not Found"
	    end
	end

	def edit
		@team = current_user.teams.find(params[:id])
	end

	def update
		@team = current_user.teams.find(params[:id])
		@team.user_id = current_user.id
		if @team.update_attributes(team_params)
			redirect_to team_path(@team.id),notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@team = current_user.teams.find(params[:id])
		@team.destroy
		redirect_to teams_path, notice: "Successfully deleted"
	end


	private
	def team_params
		params[:team].permit(:name, :size, :team_lead, user_ids: [])
	end

end
