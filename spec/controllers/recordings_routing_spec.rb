require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RecordingsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "recordings", :action => "index").should == "/recordings"
    end
  
    it "should map #new" do
      route_for(:controller => "recordings", :action => "new").should == "/recordings/new"
    end
  
    it "should map #show" do
      route_for(:controller => "recordings", :action => "show", :id => 1).should == "/recordings/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "recordings", :action => "edit", :id => 1).should == "/recordings/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "recordings", :action => "update", :id => 1).should == "/recordings/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "recordings", :action => "destroy", :id => 1).should == "/recordings/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/recordings").should == {:controller => "recordings", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/recordings/new").should == {:controller => "recordings", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/recordings").should == {:controller => "recordings", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/recordings/1").should == {:controller => "recordings", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/recordings/1/edit").should == {:controller => "recordings", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/recordings/1").should == {:controller => "recordings", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/recordings/1").should == {:controller => "recordings", :action => "destroy", :id => "1"}
    end
  end
end
