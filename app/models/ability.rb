class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.member?
      can [:create, :update], [Post, Video]
      can :read, :all
    else
      can :read, :all
    end
  end
end
