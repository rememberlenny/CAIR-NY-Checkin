require 'rails_helper'

RSpec.describe TextExchangeController, type: :controller do

  describe "GET #confirm" do
    it "returns http success" do
      get :confirm
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #additional_information" do
    it "returns http success" do
      get :additional_information
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #thanks" do
    it "returns http success" do
      get :thanks
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #checkin" do
    it "returns http success" do
      get :checkin
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #alt_confirm" do
    it "returns http success" do
      get :alt_confirm
      expect(response).to have_http_status(:success)
    end
  end

end
