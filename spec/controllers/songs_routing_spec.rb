require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SongsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "songs", :action => "index").should == "/songs"
    end
  
    it "should map #new" do
      route_for(:controller => "songs", :action => "new").should == "/songs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "songs", :action => "show", :id => 1).should == "/songs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "songs", :action => "edit", :id => 1).should == "/songs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "songs", :action => "update", :id => 1).should == "/songs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "songs", :action => "destroy", :id => 1).should == "/songs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/songs").should == {:controller => "songs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/songs/new").should == {:controller => "songs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/songs").should == {:controller => "songs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/songs/1").should == {:controller => "songs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/songs/1/edit").should == {:controller => "songs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/songs/1").should == {:controller => "songs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/songs/1").should == {:controller => "songs", :action => "destroy", :id => "1"}
    end
  end
end
