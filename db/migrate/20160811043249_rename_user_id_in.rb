class RenameUserIdIn < ActiveRecord::Migration
  def change
  	rename_column :team_members, :user_id, :enjoyer_id
  	change_column :team_members, :enjoyer_id, :integer
  end
end
