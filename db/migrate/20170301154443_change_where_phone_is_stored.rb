class ChangeWherePhoneIsStored < ActiveRecord::Migration
  def change
    add_column :checkins, :account_id, :integer
    remove_column :checkins, :phone_number
  end
end
