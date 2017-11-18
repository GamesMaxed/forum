require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test "A topic requires to have a category" do
    topic = Topic.new({:name => "Test"})

    assert topic.invalid?
    assert_not_nil topic.errors[:category]
  end

  test "Topic belongs to a category" do
    category =  Category.create({:name => "Category"})
    topic = Topic.create({:name => "Test topic 1", :category => category})

    assert_equal category, topic.category
  end
end
