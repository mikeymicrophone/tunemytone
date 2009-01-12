require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe KnobsController do

  def mock_knob(stubs={})
    @mock_knob ||= mock_model(Knob, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all knobs as @knobs" do
      Knob.should_receive(:find).with(:all).and_return([mock_knob])
      get :index
      assigns[:knobs].should == [mock_knob]
    end

    describe "with mime type of xml" do
  
      it "should render all knobs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Knob.should_receive(:find).with(:all).and_return(knobs = mock("Array of Knobs"))
        knobs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested knob as @knob" do
      Knob.should_receive(:find).with("37").and_return(mock_knob)
      get :show, :id => "37"
      assigns[:knob].should equal(mock_knob)
    end
    
    describe "with mime type of xml" do

      it "should render the requested knob as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Knob.should_receive(:find).with("37").and_return(mock_knob)
        mock_knob.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new knob as @knob" do
      Knob.should_receive(:new).and_return(mock_knob)
      get :new
      assigns[:knob].should equal(mock_knob)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested knob as @knob" do
      Knob.should_receive(:find).with("37").and_return(mock_knob)
      get :edit, :id => "37"
      assigns[:knob].should equal(mock_knob)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created knob as @knob" do
        Knob.should_receive(:new).with({'these' => 'params'}).and_return(mock_knob(:save => true))
        post :create, :knob => {:these => 'params'}
        assigns(:knob).should equal(mock_knob)
      end

      it "should redirect to the created knob" do
        Knob.stub!(:new).and_return(mock_knob(:save => true))
        post :create, :knob => {}
        response.should redirect_to(knob_url(mock_knob))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved knob as @knob" do
        Knob.stub!(:new).with({'these' => 'params'}).and_return(mock_knob(:save => false))
        post :create, :knob => {:these => 'params'}
        assigns(:knob).should equal(mock_knob)
      end

      it "should re-render the 'new' template" do
        Knob.stub!(:new).and_return(mock_knob(:save => false))
        post :create, :knob => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested knob" do
        Knob.should_receive(:find).with("37").and_return(mock_knob)
        mock_knob.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :knob => {:these => 'params'}
      end

      it "should expose the requested knob as @knob" do
        Knob.stub!(:find).and_return(mock_knob(:update_attributes => true))
        put :update, :id => "1"
        assigns(:knob).should equal(mock_knob)
      end

      it "should redirect to the knob" do
        Knob.stub!(:find).and_return(mock_knob(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(knob_url(mock_knob))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested knob" do
        Knob.should_receive(:find).with("37").and_return(mock_knob)
        mock_knob.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :knob => {:these => 'params'}
      end

      it "should expose the knob as @knob" do
        Knob.stub!(:find).and_return(mock_knob(:update_attributes => false))
        put :update, :id => "1"
        assigns(:knob).should equal(mock_knob)
      end

      it "should re-render the 'edit' template" do
        Knob.stub!(:find).and_return(mock_knob(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested knob" do
      Knob.should_receive(:find).with("37").and_return(mock_knob)
      mock_knob.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the knobs list" do
      Knob.stub!(:find).and_return(mock_knob(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(knobs_url)
    end

  end

end
