require 'rails_helper'

RSpec.describe "Trails", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/trails/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/trails/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/trails/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/trails/create"
      expect(response).to have_http_status(:success)
    end
  end

end
