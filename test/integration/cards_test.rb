require 'minitest_helper'

describe 'Card integration' do
  it 'shows me the card when I go to show' do
    card = FactoryGirl.create :card, name: 'shave the llama'
    visit card_path(card)
    within '.card-module' do
      page.must_have_content('shave the llama')
    end
  end

  it 'creates a card on post' do
    attrs = FactoryGirl.build(:card, folder_name: '1').attributes
    page.driver.follow :post, cards_path, card: attrs
    Card.count.must_equal 1
    current_path.must_equal folder_path(1)
  end

  it 'can complete a card' do
    card = FactoryGirl.create :card
    visit card_path(card)
    within '.card-module .complete button' do
      page.must_have_content 'Complete'
    end
    page.click_button 'Complete'
    current_path.must_equal card_path(card)
    page.wont_have_css '.card-module .complete'
  end

  it 'can move a card' do
    card = FactoryGirl.create :card, folder_name: '1'
    visit card_path(card)
    within '.card-module .folder' do
      page.must_have_content 'In folder 1'
    end
    within '.card-module .move' do
      page.must_have_css 'select'
      page.must_have_css 'input[type=submit]'
    end
    page.select '2', from: 'card_folder_name'
    page.click_button 'Move'
    current_path.must_equal card_path(card)
    within '.card-module .folder' do
      page.must_have_content 'In folder 2'
    end
  end
end
