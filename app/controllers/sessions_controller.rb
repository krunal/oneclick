class SessionsController < ApplicationController
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  #skip_before_filter :authenticate

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      user.save_token
      render :status => 200,
        :json => { :success => true,
                   :info => "Logged in",
                   :data => { :auth_token => user.authentication_token, :user => @user  } }
    else
      render :status => 200,
             :json => { :success => false,
                        :info => "Invalid email or password",
                        :data => {} }
    end
  end

  def destroy
  	current_user.update_column(:authentication_token, nil)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end



end
