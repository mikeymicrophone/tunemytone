require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AlbumsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "albums", :action => "index").should == "/albums"
    end
  
    it "should map #new" do
      route_for(:controller => "albums", :action => "new").should == "/albums/new"
    end
  
    it "should map #show" do
      route_for(:controller => "albums", :action => "show", :id => 1).should == "/albums/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "albums", :action => "edit", :id => 1).should == "/albums/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "albums", :action => "update", :id => 1).should == "/albums/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "albums", :action => "destroy", :id => 1).should == "/albums/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/albums").should == {:controller => "albums", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/albums/new").should == {:controller => "albums", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/albums").should == {:controller => "albums", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/albums/1").should == {:controller => "albums", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/albums/1/edit").should == {:controller => "albums", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/albums/1").should == {:controller => "albums", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/albums/1").should == {:controller => "albums", :action => "destroy", :id => "1"}
    end
  end
end
