require 'rails_helper'

RSpec.describe ConversationState do
  describe "catch reserve words" do
    it "if reserve is login" do
      aa = Account.new(phone: "123")
      aa.save
      keyword = "login"
      cc = ConversationResponse.new(trigger: keyword, statement: "Howdy")
      cc.save
      message = Message.new(account_id: aa.id, message: keyword, direction: "out")
      message.save

      state = ConversationState.get_response(message.message)

      expect(state).not_to eq("Howdy")
    end

    it "if reserve is summary" do
      aa = Account.new(phone: "123")
      aa.save
      keyword = "summary"
      cc = ConversationResponse.new(trigger: keyword, statement: "Howdy")
      cc.save
      message = Message.new(account_id: aa.id, message: keyword, direction: "out")
      message.save

      state = ConversationState.get_response(message.message)

      expect(state).not_to eq("Howdy")
    end

    it "if reserve is comments" do
      aa = Account.new(phone: "123")
      aa.save
      keyword = "comments"
      cc = ConversationResponse.new(trigger: keyword, statement: "Howdy")
      cc.save
      message = Message.new(account_id: aa.id, message: keyword, direction: "out")
      message.save

      state = ConversationState.get_response(message.message)

      expect(state).not_to eq("Howdy")
    end

    it "if reserve is followers" do
      aa = Account.new(phone: "123")
      aa.save
      keyword = "followers"
      cc = ConversationResponse.new(trigger: keyword, statement: "Howdy")
      cc.save
      message = Message.new(account_id: aa.id, message: keyword, direction: "out")
      message.save

      state = ConversationState.get_response(message.message)

      expect(state).not_to eq("Howdy")
    end

    it "if reserve is focus" do
      aa = Account.new(phone: "123")
      aa.save
      keyword = "focus"
      cc = ConversationResponse.new(trigger: keyword, statement: "Howdy")
      cc.save
      message = Message.new(account_id: aa.id, message: keyword, direction: "out")
      message.save

      state = ConversationState.get_response(message.message)

      expect(state).not_to eq("Howdy")
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
