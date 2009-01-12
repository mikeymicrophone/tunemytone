require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RecordingsController do

  def mock_recording(stubs={})
    @mock_recording ||= mock_model(Recording, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all recordings as @recordings" do
      Recording.should_receive(:find).with(:all).and_return([mock_recording])
      get :index
      assigns[:recordings].should == [mock_recording]
    end

    describe "with mime type of xml" do
  
      it "should render all recordings as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Recording.should_receive(:find).with(:all).and_return(recordings = mock("Array of Recordings"))
        recordings.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested recording as @recording" do
      Recording.should_receive(:find).with("37").and_return(mock_recording)
      get :show, :id => "37"
      assigns[:recording].should equal(mock_recording)
    end
    
    describe "with mime type of xml" do

      it "should render the requested recording as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Recording.should_receive(:find).with("37").and_return(mock_recording)
        mock_recording.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new recording as @recording" do
      Recording.should_receive(:new).and_return(mock_recording)
      get :new
      assigns[:recording].should equal(mock_recording)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested recording as @recording" do
      Recording.should_receive(:find).with("37").and_return(mock_recording)
      get :edit, :id => "37"
      assigns[:recording].should equal(mock_recording)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created recording as @recording" do
        Recording.should_receive(:new).with({'these' => 'params'}).and_return(mock_recording(:save => true))
        post :create, :recording => {:these => 'params'}
        assigns(:recording).should equal(mock_recording)
      end

      it "should redirect to the created recording" do
        Recording.stub!(:new).and_return(mock_recording(:save => true))
        post :create, :recording => {}
        response.should redirect_to(recording_url(mock_recording))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved recording as @recording" do
        Recording.stub!(:new).with({'these' => 'params'}).and_return(mock_recording(:save => false))
        post :create, :recording => {:these => 'params'}
        assigns(:recording).should equal(mock_recording)
      end

      it "should re-render the 'new' template" do
        Recording.stub!(:new).and_return(mock_recording(:save => false))
        post :create, :recording => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested recording" do
        Recording.should_receive(:find).with("37").and_return(mock_recording)
        mock_recording.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :recording => {:these => 'params'}
      end

      it "should expose the requested recording as @recording" do
        Recording.stub!(:find).and_return(mock_recording(:update_attributes => true))
        put :update, :id => "1"
        assigns(:recording).should equal(mock_recording)
      end

      it "should redirect to the recording" do
        Recording.stub!(:find).and_return(mock_recording(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(recording_url(mock_recording))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested recording" do
        Recording.should_receive(:find).with("37").and_return(mock_recording)
        mock_recording.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :recording => {:these => 'params'}
      end

      it "should expose the recording as @recording" do
        Recording.stub!(:find).and_return(mock_recording(:update_attributes => false))
        put :update, :id => "1"
        assigns(:recording).should equal(mock_recording)
      end

      it "should re-render the 'edit' template" do
        Recording.stub!(:find).and_return(mock_recording(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested recording" do
      Recording.should_receive(:find).with("37").and_return(mock_recording)
      mock_recording.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the recordings list" do
      Recording.stub!(:find).and_return(mock_recording(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(recordings_url)
    end

  end

end
