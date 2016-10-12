class CreateTeamMemberTasks < ActiveRecord::Migration
  def change
    create_table :team_member_tasks do |t|
    	t.integer :task_id
    	t.integer :team_member_id

      t.timestamps
    end
  end
end
