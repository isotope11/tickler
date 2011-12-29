require 'minitest_helper'

describe 'Card integration' do
  it 'shows me the card when I go to show' do
    card = Factory(:card, :name => 'shave the llama')
    visit card_path(card)
    within('.card') do
      page.must_have_content('shave the llama')
    end
  end
end
