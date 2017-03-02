class AddMoreDetails < ActiveRecord::Migration
  def change
    remove_column :checkins, :full_name
    add_column :checkins, :name_first, :string 
    add_column :checkins, :name_middle, :string 
    add_column :checkins, :name_last, :string 

    remove_column :checkins, :address
    add_column :checkins, :address_line_one, :string
    add_column :checkins, :address_line_two, :string
    add_column :checkins, :address_city, :string
    add_column :checkins, :address_state, :string
    add_column :checkins, :address_zip, :string

    remove_column :checkins, :primary_contact_name
    remove_column :checkins, :primary_contact_mobile_phone
    add_column :checkins, :alt_phone_number, :string  
  end
end
