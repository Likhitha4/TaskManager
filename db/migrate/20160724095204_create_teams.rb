class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.integer :size
    	t.string :team_lead

      t.timestamps
    end
  end
end
