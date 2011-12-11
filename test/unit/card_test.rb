require "minitest_helper"

describe Card do
  before do
    @card = Card.new(name: 'foo', description: 'foo', folder_name: '1')
  end

  it "must be valid" do
    @card.valid?.must_equal true
  end

  it "must not be valid without name" do
    @card.name = nil
    @card.valid?.must_equal false
  end

  it "must not be valid without description" do
    @card.description = nil
    @card.valid?.must_equal false
  end

  it "must not be valid without folder_name" do
    @card.folder_name = nil
    @card.valid?.must_equal false
  end

  it "must not be valid with invalid folder_name" do
    @card.folder_name = 'bar'
    @card.valid?.must_equal false
  end
end
