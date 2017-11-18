class Category < ApplicationRecord
  auto_strip_attributes :name

  validates :name, presence: true, uniqueness: true

  has_many :topics
  has_many :posts, :through => :topics

end
