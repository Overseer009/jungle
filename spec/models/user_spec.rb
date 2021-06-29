require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @new_user = User.new(first_name: "Joe", last_name: "B", email: "tim@tim.com", password: "password", password_confirmation: "password")
    end

    it "is not valid without a first name" do
      @new_user.first_name = nil
      expect(@new_user).to_not be_valid
      expect(@new_user.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid without a last name" do
      @new_user[:last_name] = nil
      expect(@new_user).to_not be_valid
      expect(@new_user.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid without a password" do
      @new_user.password = nil
      expect(@new_user).to_not be_valid
      expect(@new_user.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid when password and password confirmation match" do
      @test_user = User.new(first_name: "Joe", last_name: "B", email: "tim@tim.com", password: "password", password_confirmation: "FROMAGE")
      expect(@test_user.password).to_not eq(@test_user.password_confirmation)
    end

    it "is not valid if the password is less than 6 characters" do
      @test_user = User.new(first_name: "Joe", last_name: "B", email: "tim@tim.com", password: "1", password_confirmation: "1")
      expect(@test_user).to_not be_valid
      expect(@test_user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "is not valid without an email" do
      @new_user.email = nil
      expect(@new_user).to_not be_valid
      expect(@new_user.errors.full_messages).to include("Email can't be blank")
    end

    describe 'authenticate_with_credentials' do
      it "authenticate if email and password are correct" do
        @test_user = User.new(first_name: "Joe", last_name: "B", email: "tim@tim.com", password: "password", password_confirmation: "password")
        @test_user.save
        @corr_user = User.authenticate_with_credentials("tim@tim.com", "password")
        expect(@corr_user).to eq(@test_user)
      end

      it "authenticates if user has capitalized letters in email" do
        @test_user = User.new(first_name: "Joe", last_name: "B", email: "tim@tim.com", password: "password", password_confirmation: "password")
        @test_user.save
        @corr_user = User.authenticate_with_credentials("TIM@tim.com", "password")
        expect(@corr_user).to eq(@test_user)
      end

      it "authenticates if user has capitalized letters in email" do
        @test_user = User.new(first_name: "Joe", last_name: "B", email: "tim@tim.com", password: "password", password_confirmation: "password")
        @test_user.save
        @corr_user = User.authenticate_with_credentials(" tim@tim.com ", "password")
        expect(@corr_user).to eq(@test_user)
      end
    end
  end
end
