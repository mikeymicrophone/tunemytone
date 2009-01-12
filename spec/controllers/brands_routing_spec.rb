require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BrandsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "brands", :action => "index").should == "/brands"
    end
  
    it "should map #new" do
      route_for(:controller => "brands", :action => "new").should == "/brands/new"
    end
  
    it "should map #show" do
      route_for(:controller => "brands", :action => "show", :id => 1).should == "/brands/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "brands", :action => "edit", :id => 1).should == "/brands/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "brands", :action => "update", :id => 1).should == "/brands/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "brands", :action => "destroy", :id => 1).should == "/brands/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/brands").should == {:controller => "brands", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/brands/new").should == {:controller => "brands", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/brands").should == {:controller => "brands", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/brands/1").should == {:controller => "brands", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/brands/1/edit").should == {:controller => "brands", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/brands/1").should == {:controller => "brands", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/brands/1").should == {:controller => "brands", :action => "destroy", :id => "1"}
    end
  end
end
