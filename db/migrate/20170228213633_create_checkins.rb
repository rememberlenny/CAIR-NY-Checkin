class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :phone_number
      t.string :hex_id

      t.timestamps null: false
    end
  end
end
