require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BandsController do

  def mock_band(stubs={})
    @mock_band ||= mock_model(Band, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all bands as @bands" do
      Band.should_receive(:find).with(:all).and_return([mock_band])
      get :index
      assigns[:bands].should == [mock_band]
    end

    describe "with mime type of xml" do
  
      it "should render all bands as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Band.should_receive(:find).with(:all).and_return(bands = mock("Array of Bands"))
        bands.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested band as @band" do
      Band.should_receive(:find).with("37").and_return(mock_band)
      get :show, :id => "37"
      assigns[:band].should equal(mock_band)
    end
    
    describe "with mime type of xml" do

      it "should render the requested band as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Band.should_receive(:find).with("37").and_return(mock_band)
        mock_band.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new band as @band" do
      Band.should_receive(:new).and_return(mock_band)
      get :new
      assigns[:band].should equal(mock_band)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested band as @band" do
      Band.should_receive(:find).with("37").and_return(mock_band)
      get :edit, :id => "37"
      assigns[:band].should equal(mock_band)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created band as @band" do
        Band.should_receive(:new).with({'these' => 'params'}).and_return(mock_band(:save => true))
        post :create, :band => {:these => 'params'}
        assigns(:band).should equal(mock_band)
      end

      it "should redirect to the created band" do
        Band.stub!(:new).and_return(mock_band(:save => true))
        post :create, :band => {}
        response.should redirect_to(band_url(mock_band))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved band as @band" do
        Band.stub!(:new).with({'these' => 'params'}).and_return(mock_band(:save => false))
        post :create, :band => {:these => 'params'}
        assigns(:band).should equal(mock_band)
      end

      it "should re-render the 'new' template" do
        Band.stub!(:new).and_return(mock_band(:save => false))
        post :create, :band => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested band" do
        Band.should_receive(:find).with("37").and_return(mock_band)
        mock_band.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :band => {:these => 'params'}
      end

      it "should expose the requested band as @band" do
        Band.stub!(:find).and_return(mock_band(:update_attributes => true))
        put :update, :id => "1"
        assigns(:band).should equal(mock_band)
      end

      it "should redirect to the band" do
        Band.stub!(:find).and_return(mock_band(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(band_url(mock_band))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested band" do
        Band.should_receive(:find).with("37").and_return(mock_band)
        mock_band.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :band => {:these => 'params'}
      end

      it "should expose the band as @band" do
        Band.stub!(:find).and_return(mock_band(:update_attributes => false))
        put :update, :id => "1"
        assigns(:band).should equal(mock_band)
      end

      it "should re-render the 'edit' template" do
        Band.stub!(:find).and_return(mock_band(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested band" do
      Band.should_receive(:find).with("37").and_return(mock_band)
      mock_band.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the bands list" do
      Band.stub!(:find).and_return(mock_band(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(bands_url)
    end

  end

end
