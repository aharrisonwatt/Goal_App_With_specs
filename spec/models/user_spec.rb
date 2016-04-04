require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  # ensures_session_token after_initialize
  # password is not saved to database
  # password length >= 6
  # password is nil, true
  # encrypts password using BCrypt
  # validates presence of username, session_token, and password_digest
  # changes session token each time user is initialized



end
