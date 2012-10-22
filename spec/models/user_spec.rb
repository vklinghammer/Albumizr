require 'spec_helper'

describe User do

  before(:each) do
    @user = User.new(
      name: "user",
      password: "password",
      password_confirmation: "password"
    )
  end

  it { should respond_to(:name) }
  it { should respond_to(:authenticate) }

  it "is valid with valid attributes" do
    @user.should be_valid
  end

  it "is invalid if name is blank" do
    @user.name = " "
    @user.should_not be_valid
  end

  it "is invalid if name is too short" do
    @user.name = "a" * (2-1)
    should_not be_valid
  end

  it "is invalid if name is too long" do
    @user.name = "a" * (42+1)
    should_not be_valid
  end


  it "is invalid if password is blank" do
    @user.password = " "
    should_not be_valid
  end

  it "is invalid if password is too short" do
    @user.password = "a" * (6-1)
    should_not be_valid
  end

  it "is invalid if password confirmation is blank" do
    @user.password_confirmation = " "
    should_not be_valid
  end

  describe "invalid if name is already taken" do
    before {
      duplicate = @user.dup
      duplicate.save
    }
    it { should_not be_valid }
  end

end