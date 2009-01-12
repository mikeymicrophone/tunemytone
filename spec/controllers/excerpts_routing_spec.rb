require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExcerptsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "excerpts", :action => "index").should == "/excerpts"
    end
  
    it "should map #new" do
      route_for(:controller => "excerpts", :action => "new").should == "/excerpts/new"
    end
  
    it "should map #show" do
      route_for(:controller => "excerpts", :action => "show", :id => 1).should == "/excerpts/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "excerpts", :action => "edit", :id => 1).should == "/excerpts/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "excerpts", :action => "update", :id => 1).should == "/excerpts/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "excerpts", :action => "destroy", :id => 1).should == "/excerpts/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/excerpts").should == {:controller => "excerpts", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/excerpts/new").should == {:controller => "excerpts", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/excerpts").should == {:controller => "excerpts", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/excerpts/1").should == {:controller => "excerpts", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/excerpts/1/edit").should == {:controller => "excerpts", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/excerpts/1").should == {:controller => "excerpts", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/excerpts/1").should == {:controller => "excerpts", :action => "destroy", :id => "1"}
    end
  end
end
