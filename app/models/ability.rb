class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.member?
      can [:update], User, id: user.id
      can [:show], User
    else
      can :manage, Project
      can :manage, Sprint
      can :manage, User
      can :manage, WorkPerformance
    end
  end
end