require 'rails_helper'

RSpec.describe SwitchboardController, type: :controller do

  describe "#sms" do
    it "gets phone number and body content" do
      phone = "+19493228496"
      message = "Test content"
      post :sms, { From: phone, Body: message }
      expect(response.body).to eq({status: "success", message: message.to_s, phone: phone.to_s}.to_json)
    end
  end

end
