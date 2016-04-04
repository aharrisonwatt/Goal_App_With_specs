require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  before :each do
    visit new_user_url
  end

  it "has a new user page" do
    expect(current_path).to eq("/users/new")
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      sign_up_as_ginger_baker
      expect(page).to have_content("ginger_baker")
      expect(current_path).to eq("/goals")
    end
  end

end

feature "logging in" do

  it "returns to sign in on failure" do
    sign_in_as_ginger_baker
    expect(page).to have_content('Sign In')
  end

  it "shows username on the homepage after login" do
    User.create!(username: 'ginger_baker', password: 'password')
    sign_in_as_ginger_baker
    expect(page).to have_content('ginger_baker')
    expect(current_path).to eq('/goals')
  end

end

feature "logging out" do
  before :each do
    visit '/goals'
  end

  it "begins with logged out state" do
    expect(page).to have_content('Sign In')
  end

  it "doesn't show username on the homepage after logout" do
    User.create!(username: 'ginger_baker', password: 'password')
    sign_in_as_ginger_baker
    click_button 'Sign Out'
    expect(current_path).to eq('/goals')
    expect(page).to_not have_content('ginger_baker')
  end

end
