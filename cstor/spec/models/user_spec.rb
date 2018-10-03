require 'rails_helper'

describe User do
  let(:user) { User.new }

  describe "attributes" do
    describe "validations" do
      it "is valid when username is present" do
        user.username = "catgirl2929"
        user.valid?
        expect(user.errors[:username]).to be_empty
      end
    end

    describe "validations" do
      it "is valid when email is present" do
        user.email = "catgirl2929@yahoo.com"
        user.valid?
        expect(user.errors[:email]).to be_empty
      end
    end

    describe "validations" do
      it "is valid when password_digest is present" do
        user.password = "lsame"
        user.valid?
        expect(user.errors[:password]).to be_empty
      end
    end
  end
end
