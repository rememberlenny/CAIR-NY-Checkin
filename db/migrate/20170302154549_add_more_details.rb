class AddMoreDetails < ActiveRecord::Migration
  def change
    remove_column :checkins, :fullname, :string 
    add_column :checkins, :name_first, :string 
    add_column :checkins, :name_middle, :string 
    add_column :checkins, :name_last, :string 

    remove_column :checkins, :address, :text 
    add_column :checkins, :address_line_one, :string
    add_column :checkins, :address_line_two, :string
    add_column :checkins, :address_city, :string
    add_column :checkins, :address_state, :string
    add_column :checkins, :address_zip, :string

    remove_column :checkins, :primary_contact_name, :string  
    remove_column :checkins, :primary_contact_mobile_phone, :string  
  end
end
