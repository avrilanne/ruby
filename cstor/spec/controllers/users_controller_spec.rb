require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  it "returns a server response of 200" do
    get :new
    expect(response).to have_http_status(200)
  end
end
