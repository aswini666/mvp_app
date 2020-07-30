class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!, except: ["/"]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    case resource.role.to_sym
      when :patient then patient_patients_path
      when :doctor then doctor_doctors_path
    end
  end


  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || after_sign_in_path_for(current_user))
  end
end
