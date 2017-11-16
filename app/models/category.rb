class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :topics

  auto_strip_attributes :name
end
