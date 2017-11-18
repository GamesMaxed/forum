require 'rails_helper'

RSpec.describe Post, :type => :model do
  it {should belong_to(:topic)}
  it {should delegate_method(:category).to(:topic)} # Test if you can get the category trough the topic
  it {should validate_presence_of(:content)}
  it {should validate_length_of(:content).is_at_least(10)}
end
