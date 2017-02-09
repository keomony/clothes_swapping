require 'rails_helper'

# include Devise::Test::ControllerHelpers
# include Devise::Test::IntegrationHelpers
#
# def setup
#     @request.env["devise.mapping"] = Devise.mappings[:admin]
#     sign_in FactoryGirl.create(:user)
# end

describe ItemsController, type: :controller do

  it "renders the index template" do
    get :index, params: {}
    expect(response).to render_template("index")
  end

end
