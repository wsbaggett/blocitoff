require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) do
    User.create!(
      email: "user@bloccit.com",
      password: "helloworld",
      password_confirmation: "helloworld",
      confirmed_at: Date.today
    )
  end

  before :each do
    sign_in user
  end

  describe "GET show" do
     it "returns http success" do
       get :show, id: user
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       get :show, id: user.id
       expect(response).to render_template :show
     end
     it "assigns current_user to @user" do
       get :show, {id: user.id}
 # #18
       expect(assigns(:user)).to eq(user)
     end
   end

end
