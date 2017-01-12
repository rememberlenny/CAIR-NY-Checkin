require 'rails_helper'

RSpec.describe ConversationState do
  describe "catch reserve words" do
    it "if reserve is login" do
    end
    it "if reserve is summary" do
    end
    it "if reserve is comments" do
    end
    it "if reserve is followers" do
    end
    it "if reserve is focus" do
    end
  end
  describe "#get_response" do
    it "create a response" do
      aa = Account.new(phone: "123")
      aa.save
      keyword = "hello"
      cc = ConversationResponse.new(trigger: keyword, statement: "Howdy")
      cc.save
      message = Message.new(account_id: aa.id, message: keyword, direction: "out")
      message.save

      state = ConversationState.get_response(message.message)

      expect(state).to eq("Howdy")
    end
  end
end
