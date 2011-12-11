require 'test_helper'

class CardTest < ActiveSupport::TestCase
  def test_is_not_valid_without_name
    card = Card.new(description: 'foo', folder_name: 1)
    assert !card.valid?
  end

  def test_is_not_valid_without_description
    card = Card.new(name: 'foo', folder_name: 1)
    assert !card.valid?
  end

  def test_is_not_valid_without_folder_name
    card = Card.new(name: 'foo', description: 'foo')
    assert !card.valid?
  end

  def test_is_not_valid_with_invalid_folder_name
    card = Card.new(name: 'foo', description: 'foo', folder_name: 'bar')
    assert !card.valid?
  end

  def test_is_valid_with_name_description_and_valid_folder_name
    card = Card.new(name: 'foo', description: 'foo', folder_name: '1')
    assert card.valid?
  end
end
