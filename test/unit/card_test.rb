require "minitest_helper"

describe Card do
  subject do
    Card.new(name: 'foo', description: 'foo', folder_name: 'jan')
  end

  describe "with valid attributes" do
    it "should be valid" do
      subject.valid?.must_equal true
    end
  end

  describe "without name" do
    it "should not be valid" do
      subject.name = nil
      subject.valid?.wont_equal true
    end
  end

  describe "without description" do
    it "should not be valid" do
      subject.description = nil
      subject.valid?.wont_equal true
    end
  end

  describe "without folder_name" do
    it "should not be valid" do
      subject.folder_name = nil
      subject.valid?.wont_equal true
    end
  end

  describe "with invalid folder_name" do
    it "should not be valid" do
      subject.folder_name = 'bar'
      subject.valid?.wont_equal true
    end
  end
end
