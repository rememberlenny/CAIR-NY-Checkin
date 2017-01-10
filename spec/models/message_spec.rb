require 'rails_helper'

RSpec.describe Message, type: :model do

 let(:message) {FactoryGirl.build(:message)}
  
  describe "#create" do
    it "setup an account" do
      message.save
      expect(message.message).not_to eq(nil)
    end
  end
end
