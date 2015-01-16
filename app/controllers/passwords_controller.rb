class PasswordsController < ApplicationController
  before_filter :authenticate

  def update
    current_user.password = params[:password]
    current_user.password_confirmation = params[:password_confirmation]
    if current_user.save
      render :status => 200,
           :json => { :success => true,
                      :info => "Password updated successfully",
                      :data => { :user => current_user } }   
    else
      render :status => 200,
             :json => { :success => false,
                        :info => current_user.errors,
                        :data => {} }
    end
  end
end

