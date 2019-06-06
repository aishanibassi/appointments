class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
