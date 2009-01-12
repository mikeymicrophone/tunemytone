require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InputsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "inputs", :action => "index").should == "/inputs"
    end
  
    it "should map #new" do
      route_for(:controller => "inputs", :action => "new").should == "/inputs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "inputs", :action => "show", :id => 1).should == "/inputs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "inputs", :action => "edit", :id => 1).should == "/inputs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "inputs", :action => "update", :id => 1).should == "/inputs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "inputs", :action => "destroy", :id => 1).should == "/inputs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/inputs").should == {:controller => "inputs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/inputs/new").should == {:controller => "inputs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/inputs").should == {:controller => "inputs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/inputs/1").should == {:controller => "inputs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/inputs/1/edit").should == {:controller => "inputs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/inputs/1").should == {:controller => "inputs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/inputs/1").should == {:controller => "inputs", :action => "destroy", :id => "1"}
    end
  end
end
