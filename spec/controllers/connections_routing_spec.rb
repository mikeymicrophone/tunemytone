require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ConnectionsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "connections", :action => "index").should == "/connections"
    end
  
    it "should map #new" do
      route_for(:controller => "connections", :action => "new").should == "/connections/new"
    end
  
    it "should map #show" do
      route_for(:controller => "connections", :action => "show", :id => 1).should == "/connections/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "connections", :action => "edit", :id => 1).should == "/connections/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "connections", :action => "update", :id => 1).should == "/connections/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "connections", :action => "destroy", :id => 1).should == "/connections/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/connections").should == {:controller => "connections", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/connections/new").should == {:controller => "connections", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/connections").should == {:controller => "connections", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/connections/1").should == {:controller => "connections", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/connections/1/edit").should == {:controller => "connections", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/connections/1").should == {:controller => "connections", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/connections/1").should == {:controller => "connections", :action => "destroy", :id => "1"}
    end
  end
end
