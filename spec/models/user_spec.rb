require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:password) }

  describe "Validations" do
    before :each do
      @user = User.new(
        first_name: "Kevin",
        last_name: "Knox",
        email: "kevin.knox@gmail.com",
        password: "1990119",
        password_confirmation: "1990119",
      )
    end

    it "user saved is true" do
      expect(@user.save()).to eql(true)
    end

    it "is not valid without matching password and password confirmation" do
      @user.password_confirmation = nil
      expect(@user.save()).to eql(false)
      expect(@user).to_not be_valid
    end

    it "email is not case sensitive" do
      @user.save()
      @user1 = User.new(
        first_name: "Deanthony",
        last_name: "Melton",
        email: "KEVIN.KNOx@gmail.com",
        password: "111",
        password_confirmation: "111",
      )
      expect(@user1.save()).to eql(false)
    end

    it "has a password that is longer than 2 digits" do
      @user.password_confirmation = "1"
      @user.password = "1"
      expect(@user.save()).to eql(false)
      expect(@user).to_not be_valid
    end

    it "Email should be unique, same email should not be saved." do
      @user.save()
      @user1 = User.new(
        first_name: "Deanthony",
        last_name: "Melton",
        email: "kevin.knox@gmail.com",
        password: "111",
        password_confirmation: "111",
      )
      expect(@user1.save()).to eql(false)
    end
  end

  describe ".authenticate_with_credentials" do
    it "should return user if the password and email are valid" do
      @user = User.create(
        first_name: "Deanthony",
        last_name: "Melton",
        email: "kevin.knox@gmail.com",
        password: "111",
        password_confirmation: "111",
      )

      expect(User.authenticate_with_credentials("kevin.knox@gmail.com", "111")).to eql(@user)
    end
  end
end
