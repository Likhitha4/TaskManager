class DropTableTeamMembers < ActiveRecord::Migration
  def change
  	drop_table :team_members
  end
end
