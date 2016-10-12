class RemoveColumnEnjoyerIdFromTeamMembers < ActiveRecord::Migration
  def change
  	remove_column :team_members, :enjoyer_id
  end
end
