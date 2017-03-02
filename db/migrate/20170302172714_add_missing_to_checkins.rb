class AddMissingToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :contact_one_name_first, :string
    add_column :checkins, :contact_one_name_last, :string
    add_column :checkins, :contact_one_phone_number, :string
    add_column :checkins, :contact_one_prefered_languag, :string
    add_column :checkins, :contact_two_name_first, :string
    add_column :checkins, :contact_two_name_last, :string
    add_column :checkins, :contact_two_phone_number, :string
    add_column :checkins, :contact_two_prefered_languag, :string
  end
end

