class FilesController < ApplicationController
  before_filter :authenticate

  def create
  	@attachment = Attachment.create!(file_object: params[:file_object], filename: params[:file_object].original_filename, user_id: current_user.id)
  	render json: @attachment
  end

  def index
    @attachments = Attachment.where(user_id: current_user.id)
    render json: @attachments 
  end

  def show
  	@attachment = Attachment.where(id: params[:id])
    render json: @attachment 
  end
end

