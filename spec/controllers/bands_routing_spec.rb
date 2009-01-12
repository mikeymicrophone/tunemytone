require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BandsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "bands", :action => "index").should == "/bands"
    end
  
    it "should map #new" do
      route_for(:controller => "bands", :action => "new").should == "/bands/new"
    end
  
    it "should map #show" do
      route_for(:controller => "bands", :action => "show", :id => 1).should == "/bands/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "bands", :action => "edit", :id => 1).should == "/bands/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "bands", :action => "update", :id => 1).should == "/bands/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "bands", :action => "destroy", :id => 1).should == "/bands/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/bands").should == {:controller => "bands", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/bands/new").should == {:controller => "bands", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/bands").should == {:controller => "bands", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/bands/1").should == {:controller => "bands", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/bands/1/edit").should == {:controller => "bands", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/bands/1").should == {:controller => "bands", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/bands/1").should == {:controller => "bands", :action => "destroy", :id => "1"}
    end
  end
end
