require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  context "invalid credentials" do

    it "doesn't allow duplicate user names" do
      post :create, user: {username: "ginger_baker", password: "password"}
      post :create, user: {username: "ginger_baker", password: "password"}
      expect(response).to render_template(:new)
      expect(flash[:errors]).to be_present
    end

    it "makes sure password are at least 6 in length" do
      post :create, user: {username: "ginger", password: "short"}
      expect(response).to render_template(:new)
      expect(flash[:errors]).to be_present
    end
  end

  context "with valid credentails" do
    it "allows duplicated passwords" do
      post :create, user: {username: "ginger_baker", password: "password"}
      post :create, user: {username: "ginger", password: "password"}
      expect(response).to redirect_to(goals_url)
    end

    it "takes the user to the goals index" do
      post :create, user: {username: "ginger", password: "password"}
      expect(response).to redirect_to(goals_url)
    end

    it "logs the user in" do
      post :create, user: {username: "ginger_baker", password: "password"}
       current_user = User.find_by_username('ginger_baker')
      expect(session[:session_token]).to eq(current_user.session_token)
    end

  end
end
