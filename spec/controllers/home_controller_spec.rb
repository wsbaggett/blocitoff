require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET main" do
       it "renders the main template" do
         get :main
          expect(response).to render_template("main")
       end
     end
end
