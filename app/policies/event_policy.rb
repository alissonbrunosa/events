class EventPolicy < ApplicationPolicy
	def index?
		true
	end

	def show?
		true
	end

	def update?
		user.id == record.user.id
	end

	def edit?
		update?
	end

	def destroy?
		update?
	end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
