class User < ActiveRecord::Base
   
    has_many :teams
    has_many :tasks
    has_many :comments
    

    has_many :team_members
    has_many :teams, through: :team_members


    has_many :team_member_tasks
    has_many :tasks, through: :team_member_tasks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

      def is_admin?
      return true if self.role == "admin"
      end 
end