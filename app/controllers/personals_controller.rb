class PersonalsController < ApplicationController
	before_action :authenticate_user!
    load_and_authorize_resource

	def index
		@personals = Personal.all
	end

	def new
		@personal = Personal.new
	end

	def create
		@personal = Personal.create(personal_params)
		if @personal.save
			redirect_to personals_path, notice:"Successfully created"
		else
			render action: "new"
		end
	end

	def show
		begin
		@personal =Personal.find(params[:id])
	    rescue ActiveRecord::RecordNotFound
	    	redirect_to personals_path, notice: "Record Not Found"
	    end
	end

	def edit
    	@personal = Personals.find(params[:id])
    end

    def update
    	@personal = Personal.find(params[:id])
    	if @personal.update_attributes(personal_params)
    		redirect_to personal_path(@personal.id),notice: "Successfully updated"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@personal = Personal.find(params[:id])
    	@personal.destroy
    	redirect_to personals_path,notice: "Successfully deleted"
    end


	private
	def task_params
		params[:personal].permit(:name, :title, :start_date, :due_date, :is_completed, :priority, :privacy)
	end

end

