class Ability
  include CanCan::Ability

  def initialize(user)
    #user ||= User.new # guest user
    #if user.role? 'Businessman'
    can :manage, :all
    #end
  end
end
