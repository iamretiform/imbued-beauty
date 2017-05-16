class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :subject
      t.string :description
      t.date :date
      t.time :start_time
      t.string :address
      t.belongs_to :admin_user, index: true
      t.belongs_to :client, index: true

      t.timestamps
    end
  end
end
