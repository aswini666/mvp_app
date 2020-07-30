class AppointmentEmailMailer < ApplicationMailer
  def appointment_mail(appointment)
    @patient = appointment.patient
    @doctor = appointment.doctor
    @appointment = appointment
    mail(to: @doctor.email, from: @patient.email, subject: "Appointment Date" )
  end
end
