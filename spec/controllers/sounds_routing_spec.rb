require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SoundsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "sounds", :action => "index").should == "/sounds"
    end
  
    it "should map #new" do
      route_for(:controller => "sounds", :action => "new").should == "/sounds/new"
    end
  
    it "should map #show" do
      route_for(:controller => "sounds", :action => "show", :id => 1).should == "/sounds/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "sounds", :action => "edit", :id => 1).should == "/sounds/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "sounds", :action => "update", :id => 1).should == "/sounds/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "sounds", :action => "destroy", :id => 1).should == "/sounds/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/sounds").should == {:controller => "sounds", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/sounds/new").should == {:controller => "sounds", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/sounds").should == {:controller => "sounds", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/sounds/1").should == {:controller => "sounds", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/sounds/1/edit").should == {:controller => "sounds", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/sounds/1").should == {:controller => "sounds", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/sounds/1").should == {:controller => "sounds", :action => "destroy", :id => "1"}
    end
  end
end
