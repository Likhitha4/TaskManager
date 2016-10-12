class RenameColumnToTeamMemberTasks < ActiveRecord::Migration
  def change
  	remove_column :team_member_tasks, :team_member_id
  	add_column :team_member_tasks, :user_id, :integer 
  end
end
