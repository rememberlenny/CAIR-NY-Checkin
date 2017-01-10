require 'rails_helper'

RSpec.describe ConversationResponse, type: :model do
  let(:conversation_response) {FactoryGirl.build(:conversation_response)}
  
  describe "#get_response" do
    it "test a conversation response" do
      response_array = []
      keyword = "hello"
      cc = ConversationResponse.new(trigger: keyword, statement: "Howdy")
      cc.save
      cc = ConversationResponse.new(trigger: keyword, statement: "Whats up!")
      cc.save

      ccc = ConversationResponse.where(trigger: keyword)
      ccc.each do |conversation_result|
        response_array << conversation_result.statement
      end

      conversation_response = ConversationState.get_response(keyword)

      expect(response_array.include? conversation_response).to eq(true)
    end
  end
end