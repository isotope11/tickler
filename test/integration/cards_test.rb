require 'minitest_helper'

describe 'Card integration' do
  it 'shows me the card when I go to show' do
    card = FactoryGirl.create :card, :name => 'shave the llama'
    visit card_path(card)
    within '.card' do
      page.must_have_content('shave the llama')
    end
  end

  it 'creates a card on post' do
    attrs = FactoryGirl.build(:card, :folder_name => '1').attributes
    page.driver.follow :post, cards_path, :card => attrs
    Card.count.must_equal 1
    current_path.must_equal folder_path(1)
  end

  it 'updates a card on put' do
    card = FactoryGirl.create :card, :name => 'shave the llama'
    visit card_path(card)
    within '.card .complete button' do
      page.must_have_content 'Complete'
    end
    attrs = { completed: true }
    page.driver.follow :put, card_path(card), :card => attrs
    current_path.must_equal card_path(card)
    page.wont_have_css '.card .complete'
  end
end
