class FilesController < ApplicationController
  before_filter :authenticate

  def create
  	@attachment = Attachment.create!(file_object: params[:file_object], filename: params[:file_object].original_filename, user_id: current_user.id)
  	respond_to do |format|
  	  format.json { render json: @attachment }
  	end
  end

  def index
    @attachments = Attachment.where(user_id: current_user.id)
    respond_to do |format|
      format.json { render json: @attachments }
    end
  end

  def show
  	@attachment = Attachment.where(id: params[:id])
  	respond_to do |format|
	    format.json { render json: @attachment }
	  end
  end
end

