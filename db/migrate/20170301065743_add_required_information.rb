class AddRequiredInformation < ActiveRecord::Migration
  def change
    add_column :checkins, :full_name, :string 
    add_column :checkins, :address, :text 
    add_column :checkins, :interview_location, :string 
    add_column :checkins, :interview_date, :string  
    add_column :checkins, :interview_time, :string  
    add_column :checkins, :primary_contact_name, :string  
    add_column :checkins, :primary_contact_mobile_phone, :string  
  end
end




