class Video < ApplicationRecord
  include PublicActivity::Model
  tracked owner: -> (controller, model) {controller.current_user}
  belongs_to :user
  mount_uploader :video_url, VideoUploader
  scope :order_by, -> {order created_at: :desc}
  delegate :name, to: :user, prefix: :user, allow_nil: true
end
