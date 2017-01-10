require 'rails_helper'

RSpec.describe ConversationState do
  describe "#get_response" do
    it "create a response" do
      aa = Account.new(phone: "123")
      aa.save
      message = Message.new(account_id: aa.id, message: "blah", direction: "out")
      message.save

      state = ConversationState.get_response(message.id)

      expect(true).to eq(state)
    end
  end
end
