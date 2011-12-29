class Card < ActiveRecord::Base
  DAY_FOLDER_NAMES = (1..31).to_a.map(&:to_s)
  MONTH_FOLDER_NAMES = %w(jan feb mar apr may jun jul aug sep oct nov dec)
  VALID_FOLDER_NAMES = DAY_FOLDER_NAMES + MONTH_FOLDER_NAMES

  validates_presence_of :name, :description, :folder_name
  validates_inclusion_of :folder_name, in: VALID_FOLDER_NAMES
end
