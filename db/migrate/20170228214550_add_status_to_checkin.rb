class AddStatusToCheckin < ActiveRecord::Migration
  def change
    add_column :checkins, :status, :string
  end
end
