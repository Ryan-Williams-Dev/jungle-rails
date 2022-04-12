require 'rails_helper'

RSpec.describe User, type: :model do

  subject do
    described_class.new(
      first_name:            "Hello",
      last_name:             "There",
      email:                 "test@test.com",
      password:              "test",
      password_confirmation: "test"
    )
  end
  
  describe 'validations' do

    it "is valid" do
      expect(subject).to be_valid
    end

    it "requires first name" do
      subject.first_name = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("First name can't be blank")
    end

    it "requires last name" do
      subject.last_name = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Last name can't be blank")
    end

    it "requires password" do
      subject.password = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

    it "requires password confirmation" do
      subject.password_confirmation = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "requires password confirmation to match" do
      subject.password_confirmation = "testing"
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "requires password to be a certain length" do
      subject.password = "q"
      subject.password_confirmation = "q"
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

    it "will not be valid if email already exists" do
      user = User.new(
        first_name: "same",
        last_name: "email",
        email: "TEST@TEST.COM",
        password: "blegh",
        password_confirmation: "blegh"
      )
      user.save
      expect(user).to be_valid
      subject.save
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end

  end

  describe '.authenticate_with_credentials' do

    it "return a user when given valid credentials" do
      subject.save
      user = User.authenticate_with_credentials("test@test.com", "test")
      expect(user.email).to eq("test@test.com")
    end

    it "return nil when passed nil for both arguments" do
      expect(User.authenticate_with_credentials(nil, nil)).to eq(nil)
    end

    it "return nil when passed a valid email and nil as the password" do
      subject.save
      expect(User.authenticate_with_credentials("test@test.com", nil)).to eq(nil)
    end

    it "return nil when passed a valid email and an invalid password" do
      subject.save
      expect(User.authenticate_with_credentials("test@test.com", "tronk")).to eq(nil)
    end

    it "return a user with valid email and password case insensitive with outside spaces" do
      subject.save
      user = User.authenticate_with_credentials("  TEsT@TeST.CoM  ", "test")
      expect(user.email).to eq("test@test.com")
    end

  end

end
