require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VenuesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "venues", :action => "index").should == "/venues"
    end
  
    it "should map #new" do
      route_for(:controller => "venues", :action => "new").should == "/venues/new"
    end
  
    it "should map #show" do
      route_for(:controller => "venues", :action => "show", :id => 1).should == "/venues/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "venues", :action => "edit", :id => 1).should == "/venues/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "venues", :action => "update", :id => 1).should == "/venues/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "venues", :action => "destroy", :id => 1).should == "/venues/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/venues").should == {:controller => "venues", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/venues/new").should == {:controller => "venues", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/venues").should == {:controller => "venues", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/venues/1").should == {:controller => "venues", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/venues/1/edit").should == {:controller => "venues", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/venues/1").should == {:controller => "venues", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/venues/1").should == {:controller => "venues", :action => "destroy", :id => "1"}
    end
  end
end
