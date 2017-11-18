require 'rails_helper'

RSpec.describe Category, :type => :model do
  it 'is valid with valid attributes' do
    expect(Category.new(name: 'Category')).to be_valid
  end

  it {should validate_presence_of(:name)}

  describe 'Associations' do
    it {should have_many(:topics)}
    it {should have_many(:posts)}
  end

end
