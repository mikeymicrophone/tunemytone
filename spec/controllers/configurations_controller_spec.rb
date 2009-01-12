require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ConfigurationsController do

  def mock_configuration(stubs={})
    @mock_configuration ||= mock_model(Configuration, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all configurations as @configurations" do
      Configuration.should_receive(:find).with(:all).and_return([mock_configuration])
      get :index
      assigns[:configurations].should == [mock_configuration]
    end

    describe "with mime type of xml" do
  
      it "should render all configurations as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Configuration.should_receive(:find).with(:all).and_return(configurations = mock("Array of Configurations"))
        configurations.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested configuration as @configuration" do
      Configuration.should_receive(:find).with("37").and_return(mock_configuration)
      get :show, :id => "37"
      assigns[:configuration].should equal(mock_configuration)
    end
    
    describe "with mime type of xml" do

      it "should render the requested configuration as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Configuration.should_receive(:find).with("37").and_return(mock_configuration)
        mock_configuration.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new configuration as @configuration" do
      Configuration.should_receive(:new).and_return(mock_configuration)
      get :new
      assigns[:configuration].should equal(mock_configuration)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested configuration as @configuration" do
      Configuration.should_receive(:find).with("37").and_return(mock_configuration)
      get :edit, :id => "37"
      assigns[:configuration].should equal(mock_configuration)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created configuration as @configuration" do
        Configuration.should_receive(:new).with({'these' => 'params'}).and_return(mock_configuration(:save => true))
        post :create, :configuration => {:these => 'params'}
        assigns(:configuration).should equal(mock_configuration)
      end

      it "should redirect to the created configuration" do
        Configuration.stub!(:new).and_return(mock_configuration(:save => true))
        post :create, :configuration => {}
        response.should redirect_to(configuration_url(mock_configuration))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved configuration as @configuration" do
        Configuration.stub!(:new).with({'these' => 'params'}).and_return(mock_configuration(:save => false))
        post :create, :configuration => {:these => 'params'}
        assigns(:configuration).should equal(mock_configuration)
      end

      it "should re-render the 'new' template" do
        Configuration.stub!(:new).and_return(mock_configuration(:save => false))
        post :create, :configuration => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested configuration" do
        Configuration.should_receive(:find).with("37").and_return(mock_configuration)
        mock_configuration.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :configuration => {:these => 'params'}
      end

      it "should expose the requested configuration as @configuration" do
        Configuration.stub!(:find).and_return(mock_configuration(:update_attributes => true))
        put :update, :id => "1"
        assigns(:configuration).should equal(mock_configuration)
      end

      it "should redirect to the configuration" do
        Configuration.stub!(:find).and_return(mock_configuration(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(configuration_url(mock_configuration))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested configuration" do
        Configuration.should_receive(:find).with("37").and_return(mock_configuration)
        mock_configuration.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :configuration => {:these => 'params'}
      end

      it "should expose the configuration as @configuration" do
        Configuration.stub!(:find).and_return(mock_configuration(:update_attributes => false))
        put :update, :id => "1"
        assigns(:configuration).should equal(mock_configuration)
      end

      it "should re-render the 'edit' template" do
        Configuration.stub!(:find).and_return(mock_configuration(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested configuration" do
      Configuration.should_receive(:find).with("37").and_return(mock_configuration)
      mock_configuration.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the configurations list" do
      Configuration.stub!(:find).and_return(mock_configuration(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(configurations_url)
    end

  end

end
