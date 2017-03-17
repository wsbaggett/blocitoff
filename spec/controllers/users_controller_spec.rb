require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:current_user) do
    User.create!(
      email: "user@bloccit.com",
      password: "helloworld",
      password_confirmation: "helloworld",
      confirmed_at: Date.today
    )
  end

  describe "GET show" do
     it "returns http success" do
       sign_in current_user
       get :show, id: current_user
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       sign_in current_user
       get :show, id: current_user.id
       expect(response).to render_template :show
     end
     it "assigns current_user to @user" do
       sign_in current_user
       get :show, {id: current_user.id}
 # #18
       expect(assigns(:user)).to eq(current_user)
     end
   end

end
