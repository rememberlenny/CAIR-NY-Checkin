class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages, id: :uuid  do |t|
      t.uuid :account_id
      t.text :message

      t.timestamps null: false
    end
  end
end
