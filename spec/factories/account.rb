require 'ffaker'
FactoryGirl.define do
  factory :account do
    phone       { FFaker::PhoneNumber.phone_number }
  end
end
