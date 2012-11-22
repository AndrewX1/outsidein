require 'spec_helper'
  describe Comment do
    before :all do
      @comment = Comment.new(body: "this is a comment")
     end
  
  describe "#new" do
    it "takes one parameter and returns a Comment object" do
      @comment.should be_an_instance_of Comment
    end
  end
  
  describe "#comment" do
    it "returns the correct comment" do
      @comment.body.should eql "this is a comment"
    end
  end
end

