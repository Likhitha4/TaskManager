class AddUserIdToTeamMembers < ActiveRecord::Migration
  def change
  	add_column :team_members, :user_id, :integer
  end
end
