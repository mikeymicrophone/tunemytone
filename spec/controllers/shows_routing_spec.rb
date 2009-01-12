require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShowsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "shows", :action => "index").should == "/shows"
    end
  
    it "should map #new" do
      route_for(:controller => "shows", :action => "new").should == "/shows/new"
    end
  
    it "should map #show" do
      route_for(:controller => "shows", :action => "show", :id => 1).should == "/shows/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "shows", :action => "edit", :id => 1).should == "/shows/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "shows", :action => "update", :id => 1).should == "/shows/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "shows", :action => "destroy", :id => 1).should == "/shows/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/shows").should == {:controller => "shows", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/shows/new").should == {:controller => "shows", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/shows").should == {:controller => "shows", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/shows/1").should == {:controller => "shows", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/shows/1/edit").should == {:controller => "shows", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/shows/1").should == {:controller => "shows", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/shows/1").should == {:controller => "shows", :action => "destroy", :id => "1"}
    end
  end
end
