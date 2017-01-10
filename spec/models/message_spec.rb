require 'rails_helper'

RSpec.describe Message, type: :model do

 let(:message) {FactoryGirl.build(:message)}
  
  describe "#create_on_account" do
    it "setup an account" do
      message.save
      expect(message.message).not_to eq(nil)
    end
    
    it "checks for existing account" do
      phone = FFaker::PhoneNumber.phone_number
      message = "123"
      total = Message.all.count
      Message.create_on_account(phone, message)
      new_total = Message.all.count
      expect(new_total).to eq(total + 1)
    end
  end

end
