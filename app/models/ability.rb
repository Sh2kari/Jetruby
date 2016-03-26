class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :trainer
      can :manage, Course, user_id: user.id
      can :manage, Lesson, user_id: user.id
    else
      can :read, Lesson
    end
  end
end
