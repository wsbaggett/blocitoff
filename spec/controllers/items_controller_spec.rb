require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:user) do
    User.create!(
      email: "user@bloccit.com",
      password: "helloworld",
      password_confirmation: "helloworld",
      confirmed_at: Date.today
    )
  end

  let(:item) { Item.create!(name: 'Item name', user: user) }

  before :each do
    sign_in user
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @item" do
        get :new
        expect(assigns(:item)).not_to be_nil
      end
  end

  describe "Item create" do
       it "increases the number of items by 1" do
          expect{ post :create, item: { name: 'Item name', user: user } }.to change(Item,:count).by(1)
       end

       it "redirects to the user show view" do
         post :create, user_id: user.id, item: {name: 'Item name'}
         expect(response).to redirect_to user
       end
     end

     describe "DELETE destroy" do
       it "deletes the item" do
         delete :destroy, user_id: user.id, id: item.id
         count = Item.where({id: item.id}).count
         expect(count).to eq 0
       end

       it "redirects to the show view" do
         delete :destroy, user_id: user.id, id: item.id
         expect(response).to redirect_to user
       end
     end

end
