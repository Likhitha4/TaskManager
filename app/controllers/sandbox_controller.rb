class SandboxController < ApplicationController
	def teams
		@teams = Team.all
	end
    def team_members
    	@team_members = Team_member.all
    end
    def tasks
    @tasks = Task.all
    #@completed_tasks = Task.where('is_completed =?', true)
    #@incompleted_tasks = Task.where('is_completed =? AND due_date >= ?', false, Date.today)
    #@over_due_tasks = Task.where('due_date < ? AND is_completed = ?', Date.today, false)
    end

end
