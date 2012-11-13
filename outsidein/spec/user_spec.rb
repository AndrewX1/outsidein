require 'spec_helper'
describe User do
  before :all do
    @user = User.new(username: "bobby", email: "test@test.com", password: "abc")
  end  

  describe "#new" do
    it "takes two parameters and returns a User object" do
      @user.should be_an_instance_of User
    end
  end

  describe "#username" do
    it "returns the correct username" do
      @user.username.should eql "bobby"
    end
  end

  describe "#email" do
    it "returns the correct email" do
      @user.email.should eql "test@test.com"
    end
  end

  describe "#password" do
    it "returns the correct password" do
      @user.password.should eql "abc"
    end
  end
end
