class Task < ActiveRecord::Base

	

belongs_to :user
belongs_to :team

has_many :comments
has_many :users, through: :comments
has_many :team_member_tasks
has_many :users, through: :team_member_tasks

#after_save :send_email

validates_presence_of :title
#validates_uniqueness_of :priority
validates_numericality_of :team_id, scope: :user_id



   def list_tasks
	  Task.where('team_id = ?', self.id)
	end



validate :check_valid_date
 private

def check_valid_date
 	if (!self.due_date.nil? && !self.start_date.nil?) && (self.due_date <= self.start_date)
 		errors.add(:due_date, "is invalid")
 	end



  #def send_email
  #	Notification.assign(self, current_user).deliver!
  #end
 end

#def check_valid_date
 	#if(self.due_date < self.team.start_date)
 		#errors.add(:due_date, "is invalid")
 	#end
 #end
end