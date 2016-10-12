class TeamMember < ActiveRecord::Base

    belongs_to :user
	belongs_to :team 

	#has_many :team_member_tasks
	#has_many :tasks, through: :team_member_tasks



end
