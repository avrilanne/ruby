require "rails_helper"

RSpec.describe "Routing to users", :type => :routing do
  it "routes to new user" do
    expect(:get => new_user_path).to route_to("users#new")
  end


  # make this a controller test
end
