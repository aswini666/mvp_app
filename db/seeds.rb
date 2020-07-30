# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  20.times do |index|
    Patient.create!(first_name: "first_#{index}_name", last_name: " last_#{index}_name", email: "patient#{index}@mail.com", password: "123456", role: "patient")
  end
  p "Created #{Patient.count} Patient"

  20.times do |index|
    Doctor.create!(first_name: "first_#{index}_name", last_name: " last_#{index}_name", email: "doctor#{index}@mail.com", password: "123456", role: "doctor")
  end
  p "Created #{Doctor.count} Doctor"