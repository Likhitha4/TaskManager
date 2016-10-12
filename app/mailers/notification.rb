class Notification < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.assign.subject
  #
  def assign(task,user)
    @task = task
    @user = user
    mail_ids = @task.users.pluck(:email).join(",")
    mail to: "#{mail_ids}", cc: "#{user.email}", subject: "task is assigned"
  end
end

  