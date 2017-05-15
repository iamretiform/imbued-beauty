class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :subject
      t.string :description
      t.date :date
      t.time :start_time
      t.string :address

      t.timestamps
    end
  end
end
