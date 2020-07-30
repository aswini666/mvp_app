class Patient::PatientsController < ApplicationController
  before_action :verify_authorized

  def index
    @doctors = Doctor.all.where(role: "doctor")
    @appointments = Appointment.where(patient_id: current_user.id)
  end
  
  def create
    apoint_date = DateTime.new(params["appointment_date(1i)"].to_i,params["appointment_date(2i)"].to_i,params["appointment_date(3i)"].to_i,params["appointment_date(4i)"].to_i,params["appointment_date(5i)"].to_i)
    @appointment = Appointment.new
    @appointment.patient_id = current_user.id
    @appointment.doctor_id = params[:doctor_id]
    @appointment.appointment_date = apoint_date
    respond_to do |format|
      if @appointment.save
        #Mailer code you have to write here
        AppointmentEmailMailer.appointment_mail(@appointment).deliver_now
        format.html { redirect_to patient_patients_path, notice: 'Appointment was successfully created.' }
      else
        format.html { redirect_to patient_patients_path }
      end
    end
  end

  private

    def verify_authorized
      authorize :common, :is_patient?
    end
end
