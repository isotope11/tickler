require 'minitest_helper'

describe 'Folder integration' do
  it 'shows me the current folder when I go to show' do
    FactoryGirl.create :card, folder_name: '1', name: 'card one'
    visit folder_path('1')
    within '.folder'  do
      within 'h2' do
        page.must_have_content 'Folder: 1'
      end
      within '.cards ul' do
        page.must_have_link 'card one'
      end
    end
  end

  it 'shows me a list of folders when I go to index' do
    visit folders_path
    within '.folders ul' do
      page.must_have_link 'jan'
    end
  end

  it 'redirects me when I go to show with an invalid folder name' do
    visit folder_path('giggity')
    current_path.must_equal folders_path
  end
end
