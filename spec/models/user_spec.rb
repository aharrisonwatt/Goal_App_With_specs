require 'rails_helper'

RSpec.describe User, type: :model do

  context "Password Encryption" do
    it "does not save passwords to the database"
      
    it "uses BCrypt to encrypt the password"
  end



  # ensures_session_token after_initialize
  # password is not saved to database
  # password length >= 6
  # password is nil, true
  # encrypts password using BCrypt
  # validates presence of username, session_token, and password_digest
  # changes session token each time user is initialized



end
