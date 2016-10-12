class RemoveColumnEnjoyerIdFromComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :enjoyer_id
  end
end
