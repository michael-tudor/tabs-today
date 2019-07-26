class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Mark, user_id: user.id
  end
end
