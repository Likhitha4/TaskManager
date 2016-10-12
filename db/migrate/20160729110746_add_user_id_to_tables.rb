class AddUserIdToTables < ActiveRecord::Migration
  def change
  	add_column :teams, :user_id, :integer
  	add_column :tasks, :user_id, :integer
  end
end
