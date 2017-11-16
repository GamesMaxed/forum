class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  auto_strip_attributes :name
end
