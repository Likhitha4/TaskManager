class CreateEnjoyers < ActiveRecord::Migration
  def change
    create_table :enjoyers do |t|
    	t.string :name
    	t.string :email
    	t.string :password

      t.timestamps
    end
  end
end
