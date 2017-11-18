require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'belongs to a topic' do
    topic = Topic.create
    post = Post.create(:content => 'hello world', :topic => topic)

    assert_equal topic, post.topic
  end

  test 'cannot be created without a topic' do
    post = Post.new(:content => 'hello world')

    assert post.invalid?
    assert_not_empty post.errors[:topic]
  end

  test 'cannot be created without content' do
    topic = Topic.create
    post = Post.create(:topic => topic)

    assert post.invalid?
    assert_not_empty post.errors[:content]
  end

  test  'can get the category' do
    category = Category.create
    topic = Topic.create(:category => category)
    post = Post.create(:topic => topic)

    assert_equal category, post.category
  end

  test 'content should be atleast 10 characters' do
    to_short = Post.create(:content => "a")
    just_right = Post.create(:content => "0123456789")
    enough = Post.create(:content => "This is a very long post ...")

    assert_not_empty to_short.errors[:content]
    assert_empty just_right.errors[:content]
    assert_empty enough.errors[:content]
  end
end
