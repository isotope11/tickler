class FoldersController < ApplicationController
  def index
    @folders = Card::VALID_FOLDER_NAMES
  end

  def show
    @folder_name = params[:id]
    unless valid_folder?
      redirect_to folders_path and return
    end
    @cards = Card.for_folder(@folder_name)
  end

  protected
  def valid_folder?
    Card::VALID_FOLDER_NAMES.include? @folder_name
  end
end
