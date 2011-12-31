class CardsController < InheritedResources::Base
  defaults :resource_class => CardDecorator
  before_filter :authenticate_user!

  def create
    create! do |success, failure|
      success.html{ redirect_to folder_path(@card.folder_name) }
    end
  end

protected
  def begin_of_association_chain
    current_user
  end
end
