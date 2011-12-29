class CardsController < InheritedResources::Base
  def create
    create! do |success, failure|
      success.html{ redirect_to folder_path(@card.folder_name) }
    end
  end
end
