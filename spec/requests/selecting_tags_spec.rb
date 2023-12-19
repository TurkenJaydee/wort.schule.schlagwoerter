require 'rails_helper'

RSpec.describe "SelectingTags", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/selecting_tags/index"
      expect(response).to have_http_status(:success)
    end
  end

end
