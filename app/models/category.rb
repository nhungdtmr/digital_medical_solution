class Category < ApplicationRecord
  has_many :posts
  scope :select_categories, -> {select :id, :name}
end
