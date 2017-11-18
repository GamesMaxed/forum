class Post < ApplicationRecord
  auto_strip_attributes :content

  validates :content, presence: true, length: { minimum: 10 }

  belongs_to :topic
  delegate :category, :to => :topic, :allow_nil => false
end
