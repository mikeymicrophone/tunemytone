require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OutputsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "outputs", :action => "index").should == "/outputs"
    end
  
    it "should map #new" do
      route_for(:controller => "outputs", :action => "new").should == "/outputs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "outputs", :action => "show", :id => 1).should == "/outputs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "outputs", :action => "edit", :id => 1).should == "/outputs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "outputs", :action => "update", :id => 1).should == "/outputs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "outputs", :action => "destroy", :id => 1).should == "/outputs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/outputs").should == {:controller => "outputs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/outputs/new").should == {:controller => "outputs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/outputs").should == {:controller => "outputs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/outputs/1").should == {:controller => "outputs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/outputs/1/edit").should == {:controller => "outputs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/outputs/1").should == {:controller => "outputs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/outputs/1").should == {:controller => "outputs", :action => "destroy", :id => "1"}
    end
  end
end
