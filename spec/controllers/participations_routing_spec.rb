require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ParticipationsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "participations", :action => "index").should == "/participations"
    end
  
    it "should map #new" do
      route_for(:controller => "participations", :action => "new").should == "/participations/new"
    end
  
    it "should map #show" do
      route_for(:controller => "participations", :action => "show", :id => 1).should == "/participations/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "participations", :action => "edit", :id => 1).should == "/participations/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "participations", :action => "update", :id => 1).should == "/participations/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "participations", :action => "destroy", :id => 1).should == "/participations/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/participations").should == {:controller => "participations", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/participations/new").should == {:controller => "participations", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/participations").should == {:controller => "participations", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/participations/1").should == {:controller => "participations", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/participations/1/edit").should == {:controller => "participations", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/participations/1").should == {:controller => "participations", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/participations/1").should == {:controller => "participations", :action => "destroy", :id => "1"}
    end
  end
end
