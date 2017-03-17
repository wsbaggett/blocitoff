require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET main" do
       it "renders the main template" do
   # #2
         get :main
   # #3
         expect(response).to render_template("main")
       end
     end
end
