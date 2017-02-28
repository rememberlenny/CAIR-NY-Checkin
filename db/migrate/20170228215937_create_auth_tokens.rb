class CreateAuthTokens < ActiveRecord::Migration
  def change
    create_table :auth_tokens do |t|
      t.integer :checkin_id
      t.string :token

      t.timestamps null: false
    end
  end
end
