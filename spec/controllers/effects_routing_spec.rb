require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EffectsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "effects", :action => "index").should == "/effects"
    end
  
    it "should map #new" do
      route_for(:controller => "effects", :action => "new").should == "/effects/new"
    end
  
    it "should map #show" do
      route_for(:controller => "effects", :action => "show", :id => 1).should == "/effects/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "effects", :action => "edit", :id => 1).should == "/effects/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "effects", :action => "update", :id => 1).should == "/effects/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "effects", :action => "destroy", :id => 1).should == "/effects/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/effects").should == {:controller => "effects", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/effects/new").should == {:controller => "effects", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/effects").should == {:controller => "effects", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/effects/1").should == {:controller => "effects", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/effects/1/edit").should == {:controller => "effects", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/effects/1").should == {:controller => "effects", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/effects/1").should == {:controller => "effects", :action => "destroy", :id => "1"}
    end
  end
end
