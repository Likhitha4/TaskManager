10.times do 
	team = Team.new
	team.name = Faker::Name.title 
	team.size = Faker::Number.between(1, 10)
	team.team_lead = Faker::Name.name  
	team.save
end


3.times do 
	team_member = Team_member.new
	team_member.team_id = Team.all.pluck(:id).sample
	team_member.user_id = Team.all.pluck(:id).sample
	team_member.save
end

30.times do
	task = Task.new
	task.title = Faker::Name.title
	task.due_date = Faker::Date.between(Date.today - 2.months, 1.year.from_now)
    task.is_completed = [true,false].sample
    task.priority = Faker::Number.digit
    task.team_id = Team.all.pluck(:id).sample
	task.save
end