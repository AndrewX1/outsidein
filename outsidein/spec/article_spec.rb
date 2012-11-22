require 'spec_helper'
  describe Article do
    before :all do
      @article = Article.new(title: "hello", body: "hello world")
    end

  describe "#new" do
    it "takes two parameters and returns a Article object" do
      @article.should be_an_instance_of Article
    end
  end

  describe "#title" do
    it "returns the correct title" do
      @article.title.should eql "hello"
    end
  end

  describe "#body" do
    it "returns the correct body" do
      @article.body.should eql "hello world"
    end
  end
end
