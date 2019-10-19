class Post < ApplicationRecord
  include PublicActivity::Model
  tracked owner: -> (controller, model) {controller.current_user}
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :emotions
  mount_uploader :thumbnail, PictureUploader
  acts_as_votable
  acts_as_followable

  delegate :name, to: :category, prefix: :category, allow_nil: true
  delegate :name, to: :user, prefix: :user, allow_nil: true
  scope :order_by, -> {order created_at: :desc}
  scope :filter_post_by_type, -> category_name {Post.includes(:category)
    .where(categories: {name: category_name}) unless category_name.nil?}

  scope :order_by_relative_category, -> category {where(category_id: category)}
end
