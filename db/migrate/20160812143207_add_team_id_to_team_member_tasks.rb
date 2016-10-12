class AddTeamIdToTeamMemberTasks < ActiveRecord::Migration
  def change
  	add_column :team_member_tasks, :team_id, :integer
  end
end
