require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SettingsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "settings", :action => "index").should == "/settings"
    end
  
    it "should map #new" do
      route_for(:controller => "settings", :action => "new").should == "/settings/new"
    end
  
    it "should map #show" do
      route_for(:controller => "settings", :action => "show", :id => 1).should == "/settings/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "settings", :action => "edit", :id => 1).should == "/settings/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "settings", :action => "update", :id => 1).should == "/settings/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "settings", :action => "destroy", :id => 1).should == "/settings/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/settings").should == {:controller => "settings", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/settings/new").should == {:controller => "settings", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/settings").should == {:controller => "settings", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/settings/1").should == {:controller => "settings", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/settings/1/edit").should == {:controller => "settings", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/settings/1").should == {:controller => "settings", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/settings/1").should == {:controller => "settings", :action => "destroy", :id => "1"}
    end
  end
end
