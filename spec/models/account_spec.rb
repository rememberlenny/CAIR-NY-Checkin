require 'rails_helper'

describe Account, :type => :model do
  let(:account) {FactoryGirl.build(:account)}
  
  describe "#create" do
    it "setup an account" do
      account.save
      expect(account.phone).not_to eq(nil)
    end
  end
end

