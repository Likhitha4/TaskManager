class RemoveColumnTeamMemberIdFromTeamMemberTasks < ActiveRecord::Migration
  def change
  	remove_column :team_member_tasks, :team_member_id
  end
end
