class Card < ActiveRecord::Base
  VALID_FOLDER_NAMES = (1..31).to_a.map(&:to_s) + ('M1'..'M12').to_a
  validates_presence_of :name, :description, :folder_name
  validates_inclusion_of :folder_name, in: VALID_FOLDER_NAMES
end
