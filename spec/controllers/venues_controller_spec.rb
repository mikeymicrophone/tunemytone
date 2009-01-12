require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VenuesController do

  def mock_venue(stubs={})
    @mock_venue ||= mock_model(Venue, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all venues as @venues" do
      Venue.should_receive(:find).with(:all).and_return([mock_venue])
      get :index
      assigns[:venues].should == [mock_venue]
    end

    describe "with mime type of xml" do
  
      it "should render all venues as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Venue.should_receive(:find).with(:all).and_return(venues = mock("Array of Venues"))
        venues.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested venue as @venue" do
      Venue.should_receive(:find).with("37").and_return(mock_venue)
      get :show, :id => "37"
      assigns[:venue].should equal(mock_venue)
    end
    
    describe "with mime type of xml" do

      it "should render the requested venue as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Venue.should_receive(:find).with("37").and_return(mock_venue)
        mock_venue.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new venue as @venue" do
      Venue.should_receive(:new).and_return(mock_venue)
      get :new
      assigns[:venue].should equal(mock_venue)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested venue as @venue" do
      Venue.should_receive(:find).with("37").and_return(mock_venue)
      get :edit, :id => "37"
      assigns[:venue].should equal(mock_venue)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created venue as @venue" do
        Venue.should_receive(:new).with({'these' => 'params'}).and_return(mock_venue(:save => true))
        post :create, :venue => {:these => 'params'}
        assigns(:venue).should equal(mock_venue)
      end

      it "should redirect to the created venue" do
        Venue.stub!(:new).and_return(mock_venue(:save => true))
        post :create, :venue => {}
        response.should redirect_to(venue_url(mock_venue))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved venue as @venue" do
        Venue.stub!(:new).with({'these' => 'params'}).and_return(mock_venue(:save => false))
        post :create, :venue => {:these => 'params'}
        assigns(:venue).should equal(mock_venue)
      end

      it "should re-render the 'new' template" do
        Venue.stub!(:new).and_return(mock_venue(:save => false))
        post :create, :venue => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested venue" do
        Venue.should_receive(:find).with("37").and_return(mock_venue)
        mock_venue.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :venue => {:these => 'params'}
      end

      it "should expose the requested venue as @venue" do
        Venue.stub!(:find).and_return(mock_venue(:update_attributes => true))
        put :update, :id => "1"
        assigns(:venue).should equal(mock_venue)
      end

      it "should redirect to the venue" do
        Venue.stub!(:find).and_return(mock_venue(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(venue_url(mock_venue))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested venue" do
        Venue.should_receive(:find).with("37").and_return(mock_venue)
        mock_venue.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :venue => {:these => 'params'}
      end

      it "should expose the venue as @venue" do
        Venue.stub!(:find).and_return(mock_venue(:update_attributes => false))
        put :update, :id => "1"
        assigns(:venue).should equal(mock_venue)
      end

      it "should re-render the 'edit' template" do
        Venue.stub!(:find).and_return(mock_venue(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested venue" do
      Venue.should_receive(:find).with("37").and_return(mock_venue)
      mock_venue.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the venues list" do
      Venue.stub!(:find).and_return(mock_venue(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(venues_url)
    end

  end

end
