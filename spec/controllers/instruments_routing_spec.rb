require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InstrumentsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "instruments", :action => "index").should == "/instruments"
    end
  
    it "should map #new" do
      route_for(:controller => "instruments", :action => "new").should == "/instruments/new"
    end
  
    it "should map #show" do
      route_for(:controller => "instruments", :action => "show", :id => 1).should == "/instruments/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "instruments", :action => "edit", :id => 1).should == "/instruments/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "instruments", :action => "update", :id => 1).should == "/instruments/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "instruments", :action => "destroy", :id => 1).should == "/instruments/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/instruments").should == {:controller => "instruments", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/instruments/new").should == {:controller => "instruments", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/instruments").should == {:controller => "instruments", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/instruments/1").should == {:controller => "instruments", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/instruments/1/edit").should == {:controller => "instruments", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/instruments/1").should == {:controller => "instruments", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/instruments/1").should == {:controller => "instruments", :action => "destroy", :id => "1"}
    end
  end
end
