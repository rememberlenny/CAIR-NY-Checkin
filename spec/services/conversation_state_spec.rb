require 'rails_helper'

RSpec.describe ConversationState do
  describe "#get_response" do
    it "create a response" do
      aa = Account.new(phone: "123")
      aa.save
      keyword = "hello"
      cc = ConversationResponse.new(trigger: keyword, statement: "Howdy")
      cc.save
      cc = ConversationResponse.new(trigger: keyword, statement: "Whats up!")
      cc.save
      message = Message.new(account_id: aa.id, message: keyword, direction: "out")
      message.save

      state = ConversationState.get_response(message.message)

      expect(true).to eq(state)
    end
  end
end
