class ResetEmailJob < ActiveJob::Base
  queue_as :send_email_job

  def perform(user, temp_password)
    @user = user
    @temp_password = temp_password
    UserMailer.reset_email(@user, @temp_password).deliver_later
  end
end
