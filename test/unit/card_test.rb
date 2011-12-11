require 'test_helper'

class CardTest < ActiveSupport::TestCase
  def test_is_not_valid_without_name
    card = Card.new(:description => 'foo', :folder_name => 1)
    assert !card.valid?
  end
end
