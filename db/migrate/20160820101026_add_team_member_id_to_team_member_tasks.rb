class AddTeamMemberIdToTeamMemberTasks < ActiveRecord::Migration
  def change
  	add_column :team_member_tasks, :team_member_id, :integer
  end
end
