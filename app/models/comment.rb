class Comment < ActiveRecord::Base
    
    
	belongs_to :task
	belongs_to :user

	#validates_presence_of :description, :attachment
	#validates_numericality_of :task_id, scope: :user_id

end
