class FilesController < ApplicationController
  before_filter :authenticate, :only => [:create]

  def create
  	@attachment = Attachment.create!(file_object: params[:file_object], filename: params[:file_object].original_filename, user_id: current_user.id)
  end

  def index
    @attachments = Attachment.where(user_id: current_user.id).includes(:user)
      .page(params[:page] || 1).per(10)
      .order("created_at desc").all
  end

  def show
    id = is_integer(params[:id]) ? params[:id] : Base64.decode64(params[:id]).chomp
    @attachment = Attachment.where(id: id).first
  end

  def download
    @attachment = Attachment.where(id: params[:id]).first
    send_file @attachment.file_object.path
  end

  def is_integer(str)
    str.to_i.to_s == str
  end
end

