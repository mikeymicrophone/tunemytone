require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PerformancesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "performances", :action => "index").should == "/performances"
    end
  
    it "should map #new" do
      route_for(:controller => "performances", :action => "new").should == "/performances/new"
    end
  
    it "should map #show" do
      route_for(:controller => "performances", :action => "show", :id => 1).should == "/performances/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "performances", :action => "edit", :id => 1).should == "/performances/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "performances", :action => "update", :id => 1).should == "/performances/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "performances", :action => "destroy", :id => 1).should == "/performances/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/performances").should == {:controller => "performances", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/performances/new").should == {:controller => "performances", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/performances").should == {:controller => "performances", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/performances/1").should == {:controller => "performances", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/performances/1/edit").should == {:controller => "performances", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/performances/1").should == {:controller => "performances", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/performances/1").should == {:controller => "performances", :action => "destroy", :id => "1"}
    end
  end
end
