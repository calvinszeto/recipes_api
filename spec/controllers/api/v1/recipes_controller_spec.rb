require "rails_helper"

RSpec.describe Api::V1::RecipesController do
  let(:recipe) { FactoryGirl.create(:recipe) }

  describe "GET index" do
    it "returns all recipes" do
      recipe.save
      get :index
      expect(json_response.count).to eq(1)
      expect(json_response[0]["name"]).to eq(recipe.name)
    end
  end

  describe "POST create" do
    it "creates a new recipe" do
      new_recipe = FactoryGirl.build(:recipe)
      expect {
        post :create, params: { recipe: new_recipe.as_json }
      }.to change{Recipe.count}.from(0).to(1)
      expect(Recipe.first.name).to eq(new_recipe.name)
    end
  end

  describe "GET show" do
   it "return the specified recipe" do
      get :show, params: { id: recipe.id }
      expect(json_response["name"]).to eq(recipe.name)
    end
  end
end
