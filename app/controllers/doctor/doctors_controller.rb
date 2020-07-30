class Doctor::DoctorsController < ApplicationController
  before_action :verify_authorized

  def index
    @appointment = Appointment.where(doctor_id: current_user.id)
  end

  def appointment_status
    appointment = params[:appointment]
    @appointment = Appointment.find(appointment)
    status = params[:status]
    @appointment.status = status
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to doctor_doctors_path, notice: 'Appointment status changed.' }
      else
        format.html { redirect_to doctor_doctors_path }
      end
    end
  end

  private

    def verify_authorized
      authorize :common, :is_doctor?
    end
end
