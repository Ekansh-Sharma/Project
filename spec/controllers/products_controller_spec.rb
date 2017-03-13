require 'spec_helper'
require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do

  describe 'Create Product' do
    context "with valid attributes" do
      before(:each) do
        @params = { product: {sku_id: 'sku_id'}, format: :json }
        @headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      end

      it "creates a new product" do
        expect{
          post :create, @params, headers: @headers
        }.to change(Product,:count).by(1)
      end

      it "respond with success message" do
        post :create, @params, headers: @headers
        expect(response.body).to eq({"message"=>"Successfully Created."}.to_json)
      end
    end

    context "with invalid attributes" do
      before(:each) do
        @params = { product: {sku_id: nil}, format: :json }
      end

      it "does not save the new product" do
        expect{
          post :create, @params, headers: @headers
        }.to_not change(Product,:count)
      end

      it "respond with error message" do
        post :create, @params, headers: @headers
        expect(response.body).to eq({"erorrs"=>{"sku_id"=>["can't be blank"]}}.to_json)
      end

      it "does not save dublicate sku id" do
        params = { product: {sku_id: 'sku_id'}, format: :json }
        post :create, params, headers: @headers

        post :create, params, headers: @headers
        expect(response.body).to eq({"erorrs"=>{"sku_id"=>["has already been taken"]}}.to_json)
      end
    end 
  end
end

RSpec.describe Admin::ProductsController, type: :controller do
  describe 'GET index' do
    before(:each) do
      @product = Product.create(sku_id: 'sku_id')
    end

    it 'load index page and has a 200 status code' do
      get :index
      expect(assigns(:products)).to eq([@product])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'Edit page' do
    before(:each) do
      @product = Product.create(sku_id: 'sku_id')
    end

    it 'load edit page and has a 200 status code' do
      get :edit, id: @product.id
      expect(response.status).to eq(200)
    end

    it "renders the edit template" do
      get :edit, id: @product.id
      expect(response).to render_template("edit")
    end
  end
end

