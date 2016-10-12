class AddUserIdToTeamMemberTasks < ActiveRecord::Migration
  def change
  	add_column :team_member_tasks, :user_id, :integer
  end
end
