class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :description
    	t.integer :task_id
    	t.integer :enjoyer_id
    	t.string :attachment

      t.timestamps
    end
  end
end
