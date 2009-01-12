require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SongsController do

  def mock_song(stubs={})
    @mock_song ||= mock_model(Song, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all songs as @songs" do
      Song.should_receive(:find).with(:all).and_return([mock_song])
      get :index
      assigns[:songs].should == [mock_song]
    end

    describe "with mime type of xml" do
  
      it "should render all songs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Song.should_receive(:find).with(:all).and_return(songs = mock("Array of Songs"))
        songs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested song as @song" do
      Song.should_receive(:find).with("37").and_return(mock_song)
      get :show, :id => "37"
      assigns[:song].should equal(mock_song)
    end
    
    describe "with mime type of xml" do

      it "should render the requested song as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Song.should_receive(:find).with("37").and_return(mock_song)
        mock_song.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new song as @song" do
      Song.should_receive(:new).and_return(mock_song)
      get :new
      assigns[:song].should equal(mock_song)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested song as @song" do
      Song.should_receive(:find).with("37").and_return(mock_song)
      get :edit, :id => "37"
      assigns[:song].should equal(mock_song)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created song as @song" do
        Song.should_receive(:new).with({'these' => 'params'}).and_return(mock_song(:save => true))
        post :create, :song => {:these => 'params'}
        assigns(:song).should equal(mock_song)
      end

      it "should redirect to the created song" do
        Song.stub!(:new).and_return(mock_song(:save => true))
        post :create, :song => {}
        response.should redirect_to(song_url(mock_song))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved song as @song" do
        Song.stub!(:new).with({'these' => 'params'}).and_return(mock_song(:save => false))
        post :create, :song => {:these => 'params'}
        assigns(:song).should equal(mock_song)
      end

      it "should re-render the 'new' template" do
        Song.stub!(:new).and_return(mock_song(:save => false))
        post :create, :song => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested song" do
        Song.should_receive(:find).with("37").and_return(mock_song)
        mock_song.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :song => {:these => 'params'}
      end

      it "should expose the requested song as @song" do
        Song.stub!(:find).and_return(mock_song(:update_attributes => true))
        put :update, :id => "1"
        assigns(:song).should equal(mock_song)
      end

      it "should redirect to the song" do
        Song.stub!(:find).and_return(mock_song(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(song_url(mock_song))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested song" do
        Song.should_receive(:find).with("37").and_return(mock_song)
        mock_song.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :song => {:these => 'params'}
      end

      it "should expose the song as @song" do
        Song.stub!(:find).and_return(mock_song(:update_attributes => false))
        put :update, :id => "1"
        assigns(:song).should equal(mock_song)
      end

      it "should re-render the 'edit' template" do
        Song.stub!(:find).and_return(mock_song(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested song" do
      Song.should_receive(:find).with("37").and_return(mock_song)
      mock_song.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the songs list" do
      Song.stub!(:find).and_return(mock_song(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(songs_url)
    end

  end

end
