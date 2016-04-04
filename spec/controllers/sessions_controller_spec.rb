require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { User.create({username: "ginger_baker", password: "password"})}

  context "With invalid credentials" do
    it "renders the new page with invalid username" do
      post :create, user: {username: "wrong_person", password: "password"}
      expect(response).to render_template("new")
      expect(flash[:errors]).to be_present
    end

    it "renders the new page with invalid password" do
      post :create, user: {username: "ginger_baker", password: "wrong_password"}
      expect(response).to render_template("new")
      expect(flash[:errors]).to be_present
    end
  end

  context "With valid credentials" do
    it "redirects user to goals index on success" do
      post :create, user: {username: "ginger_baker", password: "password"}
      expect(response).to redirect_to(goals_url)
    end

    # it "Logs user in" do
    #   post :create, user: {username: "ginger_baker", password: "password"}
    #   expect(current_user).to eq(user)
    # end
  end
end
