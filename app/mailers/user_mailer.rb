class UserMailer < ApplicationMailer
  def signup_email(user, temp_password)
  	@user = user
    @temp_password = temp_password
    mail(to: @user.email, subject: 'OneClick Account Information')
  end
end
