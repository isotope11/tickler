class FoldersController < ApplicationController
  def index
    @folders = Card::VALID_FOLDER_NAMES
  end

  def show
    @folder_name = params[:id]
    unless valid_folder?
      redirect_to folders_path and return
    end
    @card = Card.new folder_name: @folder_name
    @cards = Card.for_folder(@folder_name).order('id DESC')
  end

  # Folders#current will redirect you to the folder for today's date.
  def current
    day = Time.zone.now.day
    redirect_to folder_path(day)
  end

  protected
  def valid_folder?
    Card::VALID_FOLDER_NAMES.include? @folder_name
  end
end
