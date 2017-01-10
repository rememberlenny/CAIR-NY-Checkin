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
      phone = FFaker::PhoneNumber.short_phone_number
      message = ""
      total = Account.all.count
      account.process_phone(phone, message)
      new_total = Account.all.count
      expect(new_total).to eq(total + 1)
    end

    it "checks for existing account using delay" do
      phone = FFaker::PhoneNumber.short_phone_number
      message = ""
      total = Sidekiq::Extensions::DelayedClass.jobs.size
      Account.delay.process_phone(phone, message)
      new_total = Sidekiq::Extensions::DelayedClass.jobs.size
      expect(new_total).to eq(total + 1)
    end

    it "creates a new one if it exists" do
      phone = FFaker::PhoneNumber.short_phone_number
      message = ""
      
      a = Account.new(phone: phone)
      a.save
      total = Account.all.count

      account.process_phone(phone, message)
      new_total = Account.all.count
      expect(new_total).not_to eq(total + 1)
      expect(new_total).to eq(total)
    end

    it "creates a new one using delay if it exists" do
      phone = FFaker::PhoneNumber.short_phone_number
      message = ""
      
      a = Account.new(phone: phone)
      a.save
      total = Sidekiq::Extensions::DelayedClass.jobs.size
      Account.delay.process_phone(phone, message)
      new_total = Sidekiq::Extensions::DelayedClass.jobs.size
      expect(new_total).to eq(total + 1)
    end

    it "creates a new message" do
      phone = FFaker::PhoneNumber.short_phone_number
      message = "123"
      
      a = Account.new(phone: phone)
      a.save
      total = Message.all.count

      account.process_phone(phone, message)
      new_total = Message.all.count
      expect(new_total).to eq(total + 1)
    end
  end
end

