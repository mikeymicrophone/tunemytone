require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OutputsController do

  def mock_output(stubs={})
    @mock_output ||= mock_model(Output, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all outputs as @outputs" do
      Output.should_receive(:find).with(:all).and_return([mock_output])
      get :index
      assigns[:outputs].should == [mock_output]
    end

    describe "with mime type of xml" do
  
      it "should render all outputs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Output.should_receive(:find).with(:all).and_return(outputs = mock("Array of Outputs"))
        outputs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested output as @output" do
      Output.should_receive(:find).with("37").and_return(mock_output)
      get :show, :id => "37"
      assigns[:output].should equal(mock_output)
    end
    
    describe "with mime type of xml" do

      it "should render the requested output as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Output.should_receive(:find).with("37").and_return(mock_output)
        mock_output.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new output as @output" do
      Output.should_receive(:new).and_return(mock_output)
      get :new
      assigns[:output].should equal(mock_output)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested output as @output" do
      Output.should_receive(:find).with("37").and_return(mock_output)
      get :edit, :id => "37"
      assigns[:output].should equal(mock_output)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created output as @output" do
        Output.should_receive(:new).with({'these' => 'params'}).and_return(mock_output(:save => true))
        post :create, :output => {:these => 'params'}
        assigns(:output).should equal(mock_output)
      end

      it "should redirect to the created output" do
        Output.stub!(:new).and_return(mock_output(:save => true))
        post :create, :output => {}
        response.should redirect_to(output_url(mock_output))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved output as @output" do
        Output.stub!(:new).with({'these' => 'params'}).and_return(mock_output(:save => false))
        post :create, :output => {:these => 'params'}
        assigns(:output).should equal(mock_output)
      end

      it "should re-render the 'new' template" do
        Output.stub!(:new).and_return(mock_output(:save => false))
        post :create, :output => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested output" do
        Output.should_receive(:find).with("37").and_return(mock_output)
        mock_output.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :output => {:these => 'params'}
      end

      it "should expose the requested output as @output" do
        Output.stub!(:find).and_return(mock_output(:update_attributes => true))
        put :update, :id => "1"
        assigns(:output).should equal(mock_output)
      end

      it "should redirect to the output" do
        Output.stub!(:find).and_return(mock_output(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(output_url(mock_output))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested output" do
        Output.should_receive(:find).with("37").and_return(mock_output)
        mock_output.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :output => {:these => 'params'}
      end

      it "should expose the output as @output" do
        Output.stub!(:find).and_return(mock_output(:update_attributes => false))
        put :update, :id => "1"
        assigns(:output).should equal(mock_output)
      end

      it "should re-render the 'edit' template" do
        Output.stub!(:find).and_return(mock_output(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested output" do
      Output.should_receive(:find).with("37").and_return(mock_output)
      mock_output.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the outputs list" do
      Output.stub!(:find).and_return(mock_output(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(outputs_url)
    end

  end

end
