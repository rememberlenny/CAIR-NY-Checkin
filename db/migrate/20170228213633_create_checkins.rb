class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :hex_id

      t.timestamps null: false
    end
  end
end
