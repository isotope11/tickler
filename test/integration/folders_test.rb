require 'minitest_helper'

describe 'Folder integration' do
  it "shows me today's folder when I go to current" do
    Delorean.time_travel_to('2011-01-01') do
      visit current_folders_path
      page.must_have_content 'Folder: 1'
    end
  end

  it 'shows me the current folder when I go to show' do
    FactoryGirl.create :card, folder_name: '1', name: 'card one'
    visit folder_path('1')
    within '.folder'  do
      within 'h2' do
        page.must_have_content 'Folder: 1'
      end
      within '.cards' do
        page.must_have_content 'card one'
      end
    end
  end

  it 'shows me a new card form when I go to show' do
    FactoryGirl.create :card, folder_name: '1', name: 'card one'
    visit folder_path('1')
    page.must_have_css 'input#card_name'
    page.must_have_css 'textarea#card_description'
    page.must_have_css 'input[type=submit]'
  end

  it 'shows me a list of folders when I go to index' do
    visit folders_path
    page.must_have_content 'Folders'
    within '.folders ul' do
      page.must_have_link 'jan'
    end
  end

  it 'redirects me when I go to show with an invalid folder name' do
    visit folder_path('giggity')
    current_path.must_equal folders_path
  end
end
