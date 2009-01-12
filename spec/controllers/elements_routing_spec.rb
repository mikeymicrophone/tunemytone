require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ElementsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "elements", :action => "index").should == "/elements"
    end
  
    it "should map #new" do
      route_for(:controller => "elements", :action => "new").should == "/elements/new"
    end
  
    it "should map #show" do
      route_for(:controller => "elements", :action => "show", :id => 1).should == "/elements/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "elements", :action => "edit", :id => 1).should == "/elements/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "elements", :action => "update", :id => 1).should == "/elements/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "elements", :action => "destroy", :id => 1).should == "/elements/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/elements").should == {:controller => "elements", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/elements/new").should == {:controller => "elements", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/elements").should == {:controller => "elements", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/elements/1").should == {:controller => "elements", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/elements/1/edit").should == {:controller => "elements", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/elements/1").should == {:controller => "elements", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/elements/1").should == {:controller => "elements", :action => "destroy", :id => "1"}
    end
  end
end
