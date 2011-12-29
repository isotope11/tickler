require 'minitest_helper'

describe 'Card integration' do
  it 'shows me the card when I go to show' do
    card = FactoryGirl.create :card, :name => 'shave the llama'
    visit card_path(card)
    within('.card') do
      page.must_have_content('shave the llama')
    end
  end

  it 'creates a card on post' do
    attrs = FactoryGirl.build(:card, :folder_name => '1').attributes
    page.driver.follow :post, cards_path, :card => attrs
    Card.count.must_equal 1
    current_path.must_equal '/folders/1'
  end
end
