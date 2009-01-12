require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe KnobsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "knobs", :action => "index").should == "/knobs"
    end
  
    it "should map #new" do
      route_for(:controller => "knobs", :action => "new").should == "/knobs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "knobs", :action => "show", :id => 1).should == "/knobs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "knobs", :action => "edit", :id => 1).should == "/knobs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "knobs", :action => "update", :id => 1).should == "/knobs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "knobs", :action => "destroy", :id => 1).should == "/knobs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/knobs").should == {:controller => "knobs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/knobs/new").should == {:controller => "knobs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/knobs").should == {:controller => "knobs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/knobs/1").should == {:controller => "knobs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/knobs/1/edit").should == {:controller => "knobs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/knobs/1").should == {:controller => "knobs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/knobs/1").should == {:controller => "knobs", :action => "destroy", :id => "1"}
    end
  end
end
