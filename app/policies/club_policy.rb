class ClubPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user || record.user.club_memberships.where(club_id: record, admin: true) == user
  end

  def destroy?
    update?
  end
end
