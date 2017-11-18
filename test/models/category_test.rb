require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Cannot create new category without a name" do
    assert_not Category.new.valid?
  end

  test "Category with only whitespace as name should not be validated" do
    category = Category.new({:name => "   "})

    assert category.invalid?
    assert_not_nil category.errors[:name]
  end

  test "Assert whitespace is trimmed away at the end and in the beginning" do
    category = Category.create({:name => " \nCategory \n\t\n"})

    assert_equal "Category", category.name
  end

  test "Can contain topics" do
    category = Category.create({:name => "Category"})
    first = Topic.create({:name => "Test topic 1", :category => category})
    second = Topic.create({:name => "Test topic 2", :category => category})

    assert_equal [first, second], category.topics
  end
end
