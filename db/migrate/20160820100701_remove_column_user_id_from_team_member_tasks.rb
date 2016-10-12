class RemoveColumnUserIdFromTeamMemberTasks < ActiveRecord::Migration
  def change
  	remove_column :team_member_tasks, :user_id
  end
end
