require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Cannot create new category without a name" do
    assert Category.new({:name => "Category"}).valid?
  end

  test "Category with only whitespace as name should not be validated" do
    assert_not Category.new({:name => "   "}).valid?
  end

  test "Assert whitespace is trimmed away at the end and in the beginning" do
    category = Category.create({:name => " \nCategory \n\t\n"})
    assert_equal "Category", category.name
  end
end
