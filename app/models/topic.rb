class Topic < ApplicationRecord
  auto_strip_attributes :name

  validates :name, presence: true

  belongs_to :category
  has_many :post
end
