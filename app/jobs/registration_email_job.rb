class RegistrationEmailJob < ActiveJob::Base
  queue_as :send_email_job

  def perform(user, temp_password)
    @user = user
    @temp_password = temp_password
    UserMailer.signup_email(@user, @temp_password).deliver_later
    #ExampleMailer.sample_email(@user).deliver_later
  end
end
