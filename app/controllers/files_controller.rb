class FilesController < ApplicationController
  before_filter :authenticate, :only => [:create]

  def create
  	@attachment = Attachment.create!(file_object: params[:file_object], filename: params[:file_object].original_filename, user_id: current_user.id)
  end

  def index
    @attachments = Attachment.where(user_id: current_user.id).all
    render json: @attachments 
  end

  def show
    @attachment = Attachment.where(id: params[:id]).first
  end
end

