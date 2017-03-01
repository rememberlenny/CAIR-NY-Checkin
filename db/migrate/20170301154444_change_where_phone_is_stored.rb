class ChangeWherePhoneIsStored < ActiveRecord::Migration
  def change
    add_column :checkins, :account_id, :uuid
  end
end
