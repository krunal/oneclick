class UsersController < ApplicationController
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  #skip_before_filter :authenticate

  def create
  	@user = User.new(user_params)
    @user.set_temporary_password
    if @user.save
      UserMailer.signup_email(@user, @user.temp_password).deliver_later
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { :user => @user } }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => @user.errors,
                        :data => {} }
    end
  end

  def user_params
  	params.require(:user).permit(:email, :name)
  end

end

