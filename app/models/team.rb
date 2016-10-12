class Team < ActiveRecord::Base

 belongs_to :user
 has_many :tasks
 has_many :team_members
 has_many :users, through: :team_members
 
 validates_presence_of :name, :size, :team_lead
 validates_numericality_of :size


 def completed_tasks
 	self.tasks.where('is_completed =?', is_completed = true)
 end
 
end
