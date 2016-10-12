class RemoveColumnTeamIdFromTeamMemberTasks < ActiveRecord::Migration
  def change
  	remove_column :team_member_tasks, :team_id
  end
end
