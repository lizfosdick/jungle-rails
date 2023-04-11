require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "saves new user when all fields are complete" do
      @user = User.create(firstname: "First", lastname: "Last", email: "s@sample.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it "is invalid when password and password_confirmation do not match" do
      @user = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: "password", password_confirmation: "notpassword")
      expect(@user).to_not be_valid
    end

    it "is invalid when password is blank" do
      @user = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: nil, password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "is invalid when password_confirmation is blank" do
      @user = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: "password", password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it "is invalid if email is not unique" do
      @user = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: "password", password_confirmation: "password")
      @user2 = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: "password", password_confirmation: "password")
      expect(@user2).to_not be_valid
    end

    it "is invalid when firstname is blank" do
      @user = User.create(firstname: nil, lastname: "Last", email: "sample@sample.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "is invalid when lastname is blank" do
      @user = User.create(firstname: "First", lastname: nil, email: "sample@sample.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "is invalid when email is blank" do
      @user = User.create(firstname: "First", lastname: "Last", email: nil, password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "is invalid when password is fewer than 8 characters" do
      @user = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: "passw", password_confirmation: "password")
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "returns nil if password is wrong" do
      @user = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: "password", password_confirmation: "password")
      @authenticated_user = User.authenticate_with_credentials('sample@sample.com', "passw0rd")
      expect(@authenticated_user).to be_nil
    end

    it "returns nil if email and password do not match" do
      @user = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: "password", password_confirmation: "password")
      @authenticated_user = User.authenticate_with_credentials('sample@samp.com', "password")
      expect(@authenticated_user).to be_nil
    end

    it "authenticates successfully if user types extra spaces around email" do
      @user = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: "password", password_confirmation: "password")
      @authenticated_user = User.authenticate_with_credentials('   sample@sample.com   ', "password")
      expect(@authenticated_user).to_not be_nil
    end

    it "authenticates successfully if user types email with different case" do
      @user = User.create(firstname: "First", lastname: "Last", email: "sample@sample.com", password: "password", password_confirmation: "password")
      @authenticated_user = User.authenticate_with_credentials('sAmple@sample.com', "password")
      expect(@authenticated_user).to_not be_nil
    end

  end


end
