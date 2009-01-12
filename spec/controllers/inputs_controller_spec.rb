require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InputsController do

  def mock_input(stubs={})
    @mock_input ||= mock_model(Input, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all inputs as @inputs" do
      Input.should_receive(:find).with(:all).and_return([mock_input])
      get :index
      assigns[:inputs].should == [mock_input]
    end

    describe "with mime type of xml" do
  
      it "should render all inputs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Input.should_receive(:find).with(:all).and_return(inputs = mock("Array of Inputs"))
        inputs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested input as @input" do
      Input.should_receive(:find).with("37").and_return(mock_input)
      get :show, :id => "37"
      assigns[:input].should equal(mock_input)
    end
    
    describe "with mime type of xml" do

      it "should render the requested input as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Input.should_receive(:find).with("37").and_return(mock_input)
        mock_input.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new input as @input" do
      Input.should_receive(:new).and_return(mock_input)
      get :new
      assigns[:input].should equal(mock_input)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested input as @input" do
      Input.should_receive(:find).with("37").and_return(mock_input)
      get :edit, :id => "37"
      assigns[:input].should equal(mock_input)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created input as @input" do
        Input.should_receive(:new).with({'these' => 'params'}).and_return(mock_input(:save => true))
        post :create, :input => {:these => 'params'}
        assigns(:input).should equal(mock_input)
      end

      it "should redirect to the created input" do
        Input.stub!(:new).and_return(mock_input(:save => true))
        post :create, :input => {}
        response.should redirect_to(input_url(mock_input))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved input as @input" do
        Input.stub!(:new).with({'these' => 'params'}).and_return(mock_input(:save => false))
        post :create, :input => {:these => 'params'}
        assigns(:input).should equal(mock_input)
      end

      it "should re-render the 'new' template" do
        Input.stub!(:new).and_return(mock_input(:save => false))
        post :create, :input => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested input" do
        Input.should_receive(:find).with("37").and_return(mock_input)
        mock_input.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :input => {:these => 'params'}
      end

      it "should expose the requested input as @input" do
        Input.stub!(:find).and_return(mock_input(:update_attributes => true))
        put :update, :id => "1"
        assigns(:input).should equal(mock_input)
      end

      it "should redirect to the input" do
        Input.stub!(:find).and_return(mock_input(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(input_url(mock_input))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested input" do
        Input.should_receive(:find).with("37").and_return(mock_input)
        mock_input.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :input => {:these => 'params'}
      end

      it "should expose the input as @input" do
        Input.stub!(:find).and_return(mock_input(:update_attributes => false))
        put :update, :id => "1"
        assigns(:input).should equal(mock_input)
      end

      it "should re-render the 'edit' template" do
        Input.stub!(:find).and_return(mock_input(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested input" do
      Input.should_receive(:find).with("37").and_return(mock_input)
      mock_input.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the inputs list" do
      Input.stub!(:find).and_return(mock_input(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(inputs_url)
    end

  end

end
