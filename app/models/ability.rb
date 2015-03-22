class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    alias_action :like, :dislike, :interesting, :to => :vote
    case user.role
    when 'businessman'
      can :manage, Idea
      cannot :vote, Idea

      can [:read, :update], Businessman
      can :read, Investor
    when 'investor'
      can [:read, :for_businessman, :vote], Idea

      can [:read, :update], Investor
      can :read, Businessman
    when 'admin'
      can :manage, :all
      cannot :vote, Idea
    end
  end
end
