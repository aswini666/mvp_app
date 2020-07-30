class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :patient, references: :users
      t.references :doctor, references: :users
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
