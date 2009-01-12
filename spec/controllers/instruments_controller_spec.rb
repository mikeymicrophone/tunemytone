require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InstrumentsController do

  def mock_instrument(stubs={})
    @mock_instrument ||= mock_model(Instrument, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all instruments as @instruments" do
      Instrument.should_receive(:find).with(:all).and_return([mock_instrument])
      get :index
      assigns[:instruments].should == [mock_instrument]
    end

    describe "with mime type of xml" do
  
      it "should render all instruments as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Instrument.should_receive(:find).with(:all).and_return(instruments = mock("Array of Instruments"))
        instruments.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested instrument as @instrument" do
      Instrument.should_receive(:find).with("37").and_return(mock_instrument)
      get :show, :id => "37"
      assigns[:instrument].should equal(mock_instrument)
    end
    
    describe "with mime type of xml" do

      it "should render the requested instrument as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Instrument.should_receive(:find).with("37").and_return(mock_instrument)
        mock_instrument.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new instrument as @instrument" do
      Instrument.should_receive(:new).and_return(mock_instrument)
      get :new
      assigns[:instrument].should equal(mock_instrument)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested instrument as @instrument" do
      Instrument.should_receive(:find).with("37").and_return(mock_instrument)
      get :edit, :id => "37"
      assigns[:instrument].should equal(mock_instrument)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created instrument as @instrument" do
        Instrument.should_receive(:new).with({'these' => 'params'}).and_return(mock_instrument(:save => true))
        post :create, :instrument => {:these => 'params'}
        assigns(:instrument).should equal(mock_instrument)
      end

      it "should redirect to the created instrument" do
        Instrument.stub!(:new).and_return(mock_instrument(:save => true))
        post :create, :instrument => {}
        response.should redirect_to(instrument_url(mock_instrument))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved instrument as @instrument" do
        Instrument.stub!(:new).with({'these' => 'params'}).and_return(mock_instrument(:save => false))
        post :create, :instrument => {:these => 'params'}
        assigns(:instrument).should equal(mock_instrument)
      end

      it "should re-render the 'new' template" do
        Instrument.stub!(:new).and_return(mock_instrument(:save => false))
        post :create, :instrument => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested instrument" do
        Instrument.should_receive(:find).with("37").and_return(mock_instrument)
        mock_instrument.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :instrument => {:these => 'params'}
      end

      it "should expose the requested instrument as @instrument" do
        Instrument.stub!(:find).and_return(mock_instrument(:update_attributes => true))
        put :update, :id => "1"
        assigns(:instrument).should equal(mock_instrument)
      end

      it "should redirect to the instrument" do
        Instrument.stub!(:find).and_return(mock_instrument(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(instrument_url(mock_instrument))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested instrument" do
        Instrument.should_receive(:find).with("37").and_return(mock_instrument)
        mock_instrument.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :instrument => {:these => 'params'}
      end

      it "should expose the instrument as @instrument" do
        Instrument.stub!(:find).and_return(mock_instrument(:update_attributes => false))
        put :update, :id => "1"
        assigns(:instrument).should equal(mock_instrument)
      end

      it "should re-render the 'edit' template" do
        Instrument.stub!(:find).and_return(mock_instrument(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested instrument" do
      Instrument.should_receive(:find).with("37").and_return(mock_instrument)
      mock_instrument.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the instruments list" do
      Instrument.stub!(:find).and_return(mock_instrument(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(instruments_url)
    end

  end

end
