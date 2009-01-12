require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SettingsController do

  def mock_setting(stubs={})
    @mock_setting ||= mock_model(Setting, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all settings as @settings" do
      Setting.should_receive(:find).with(:all).and_return([mock_setting])
      get :index
      assigns[:settings].should == [mock_setting]
    end

    describe "with mime type of xml" do
  
      it "should render all settings as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Setting.should_receive(:find).with(:all).and_return(settings = mock("Array of Settings"))
        settings.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested setting as @setting" do
      Setting.should_receive(:find).with("37").and_return(mock_setting)
      get :show, :id => "37"
      assigns[:setting].should equal(mock_setting)
    end
    
    describe "with mime type of xml" do

      it "should render the requested setting as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Setting.should_receive(:find).with("37").and_return(mock_setting)
        mock_setting.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new setting as @setting" do
      Setting.should_receive(:new).and_return(mock_setting)
      get :new
      assigns[:setting].should equal(mock_setting)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested setting as @setting" do
      Setting.should_receive(:find).with("37").and_return(mock_setting)
      get :edit, :id => "37"
      assigns[:setting].should equal(mock_setting)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created setting as @setting" do
        Setting.should_receive(:new).with({'these' => 'params'}).and_return(mock_setting(:save => true))
        post :create, :setting => {:these => 'params'}
        assigns(:setting).should equal(mock_setting)
      end

      it "should redirect to the created setting" do
        Setting.stub!(:new).and_return(mock_setting(:save => true))
        post :create, :setting => {}
        response.should redirect_to(setting_url(mock_setting))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved setting as @setting" do
        Setting.stub!(:new).with({'these' => 'params'}).and_return(mock_setting(:save => false))
        post :create, :setting => {:these => 'params'}
        assigns(:setting).should equal(mock_setting)
      end

      it "should re-render the 'new' template" do
        Setting.stub!(:new).and_return(mock_setting(:save => false))
        post :create, :setting => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested setting" do
        Setting.should_receive(:find).with("37").and_return(mock_setting)
        mock_setting.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :setting => {:these => 'params'}
      end

      it "should expose the requested setting as @setting" do
        Setting.stub!(:find).and_return(mock_setting(:update_attributes => true))
        put :update, :id => "1"
        assigns(:setting).should equal(mock_setting)
      end

      it "should redirect to the setting" do
        Setting.stub!(:find).and_return(mock_setting(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(setting_url(mock_setting))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested setting" do
        Setting.should_receive(:find).with("37").and_return(mock_setting)
        mock_setting.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :setting => {:these => 'params'}
      end

      it "should expose the setting as @setting" do
        Setting.stub!(:find).and_return(mock_setting(:update_attributes => false))
        put :update, :id => "1"
        assigns(:setting).should equal(mock_setting)
      end

      it "should re-render the 'edit' template" do
        Setting.stub!(:find).and_return(mock_setting(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested setting" do
      Setting.should_receive(:find).with("37").and_return(mock_setting)
      mock_setting.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the settings list" do
      Setting.stub!(:find).and_return(mock_setting(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(settings_url)
    end

  end

end
