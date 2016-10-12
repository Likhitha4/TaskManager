class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
    	t.string :name
    	t.string :title
    	t.date :due_date
    	t.boolean :is_completed
    	t.integer :priority
        t.boolean :privacy

      t.timestamps
    end
  end
end
