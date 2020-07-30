class CommonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def is_doctor?
    @user.doctor?
  end

  def is_patient?
    @user.patient?
  end

end
