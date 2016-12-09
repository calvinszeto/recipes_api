require "rails_helper"

RSpec.describe Api::V1::RecipesController do
  describe "GET index" do
    let!(:recipe) { FactoryGirl.create(:recipe) }

    it "returns recipes" do
      get :index, format: :json
      expect(json_response.count).to eq(1)
    end
  end
end
