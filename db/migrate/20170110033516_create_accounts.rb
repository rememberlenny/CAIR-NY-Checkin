class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :phone

      t.timestamps null: false
    end
  end
end
