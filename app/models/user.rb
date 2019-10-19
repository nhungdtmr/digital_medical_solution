class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_validation :set_default_role, on: :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :posts
  has_many :comments
  has_many :emotions
  has_many :videos
  enum role: %i(member admin guest)
  acts_as_voter
  acts_as_follower
  acts_as_followable

  scope :order_by, -> {order created_at: :desc}
  scope :select_users, -> {select :id, :name}
  
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(name: data["name"], email: data["email"],
        password: password, password_confirmation: password)
    end
    user
  end

  def set_default_role
    self.role ||= :member
  end
end
