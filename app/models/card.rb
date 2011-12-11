class Card < ActiveRecord::Base
  validates_presence_of :name, :description, :folder_name
end
