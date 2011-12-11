require 'minitest_helper'

describe 'Card integration' do
  it 'shows me the cards when I go to index' do
    Factory(:card, :name => 'shave the llama')
    visit cards_path
    page.must_have_selector('.cards')
    within('.cards') do
      page.must_have_content('shave the llama')
    end
  end
end
