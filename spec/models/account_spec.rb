require 'rails_helper'

describe Account, :type => :model do
  let(:account) {FactoryGirl.build(:account)}
  
  describe "#create" do
    it "setup an account" do
      account.save
      expect(account.phone).not_to eq(nil)
    end
  end

  describe "#process_phone" do
    it "checks for existing account" do
      phone = FFaker::PhoneNumber.phone_number
      total = Account.all.count
      Account.process_phone(phone)
      new_total = Account.all.count
      expect(new_total).to eq(total+1)
    end

    it "creates a new one if it exists" do
      phone = FFaker::PhoneNumber.phone_number
      
      a = Account.new(phone: phone)
      a.save
      total = Account.all.count

      Account.process_phone(phone)
      new_total = Account.all.count
      expect(new_total).not_to eq(total+1)
      expect(new_total).to eq(total)
    end
  end
end

