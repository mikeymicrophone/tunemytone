require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AlbumsController do

  def mock_album(stubs={})
    @mock_album ||= mock_model(Album, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all albums as @albums" do
      Album.should_receive(:find).with(:all).and_return([mock_album])
      get :index
      assigns[:albums].should == [mock_album]
    end

    describe "with mime type of xml" do
  
      it "should render all albums as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Album.should_receive(:find).with(:all).and_return(albums = mock("Array of Albums"))
        albums.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested album as @album" do
      Album.should_receive(:find).with("37").and_return(mock_album)
      get :show, :id => "37"
      assigns[:album].should equal(mock_album)
    end
    
    describe "with mime type of xml" do

      it "should render the requested album as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Album.should_receive(:find).with("37").and_return(mock_album)
        mock_album.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new album as @album" do
      Album.should_receive(:new).and_return(mock_album)
      get :new
      assigns[:album].should equal(mock_album)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested album as @album" do
      Album.should_receive(:find).with("37").and_return(mock_album)
      get :edit, :id => "37"
      assigns[:album].should equal(mock_album)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created album as @album" do
        Album.should_receive(:new).with({'these' => 'params'}).and_return(mock_album(:save => true))
        post :create, :album => {:these => 'params'}
        assigns(:album).should equal(mock_album)
      end

      it "should redirect to the created album" do
        Album.stub!(:new).and_return(mock_album(:save => true))
        post :create, :album => {}
        response.should redirect_to(album_url(mock_album))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved album as @album" do
        Album.stub!(:new).with({'these' => 'params'}).and_return(mock_album(:save => false))
        post :create, :album => {:these => 'params'}
        assigns(:album).should equal(mock_album)
      end

      it "should re-render the 'new' template" do
        Album.stub!(:new).and_return(mock_album(:save => false))
        post :create, :album => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested album" do
        Album.should_receive(:find).with("37").and_return(mock_album)
        mock_album.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :album => {:these => 'params'}
      end

      it "should expose the requested album as @album" do
        Album.stub!(:find).and_return(mock_album(:update_attributes => true))
        put :update, :id => "1"
        assigns(:album).should equal(mock_album)
      end

      it "should redirect to the album" do
        Album.stub!(:find).and_return(mock_album(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(album_url(mock_album))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested album" do
        Album.should_receive(:find).with("37").and_return(mock_album)
        mock_album.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :album => {:these => 'params'}
      end

      it "should expose the album as @album" do
        Album.stub!(:find).and_return(mock_album(:update_attributes => false))
        put :update, :id => "1"
        assigns(:album).should equal(mock_album)
      end

      it "should re-render the 'edit' template" do
        Album.stub!(:find).and_return(mock_album(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested album" do
      Album.should_receive(:find).with("37").and_return(mock_album)
      mock_album.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the albums list" do
      Album.stub!(:find).and_return(mock_album(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(albums_url)
    end

  end

end
