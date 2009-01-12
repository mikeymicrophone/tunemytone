require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ArtistsController do

  def mock_artist(stubs={})
    @mock_artist ||= mock_model(Artist, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all artists as @artists" do
      Artist.should_receive(:find).with(:all).and_return([mock_artist])
      get :index
      assigns[:artists].should == [mock_artist]
    end

    describe "with mime type of xml" do
  
      it "should render all artists as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Artist.should_receive(:find).with(:all).and_return(artists = mock("Array of Artists"))
        artists.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested artist as @artist" do
      Artist.should_receive(:find).with("37").and_return(mock_artist)
      get :show, :id => "37"
      assigns[:artist].should equal(mock_artist)
    end
    
    describe "with mime type of xml" do

      it "should render the requested artist as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Artist.should_receive(:find).with("37").and_return(mock_artist)
        mock_artist.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new artist as @artist" do
      Artist.should_receive(:new).and_return(mock_artist)
      get :new
      assigns[:artist].should equal(mock_artist)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested artist as @artist" do
      Artist.should_receive(:find).with("37").and_return(mock_artist)
      get :edit, :id => "37"
      assigns[:artist].should equal(mock_artist)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created artist as @artist" do
        Artist.should_receive(:new).with({'these' => 'params'}).and_return(mock_artist(:save => true))
        post :create, :artist => {:these => 'params'}
        assigns(:artist).should equal(mock_artist)
      end

      it "should redirect to the created artist" do
        Artist.stub!(:new).and_return(mock_artist(:save => true))
        post :create, :artist => {}
        response.should redirect_to(artist_url(mock_artist))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved artist as @artist" do
        Artist.stub!(:new).with({'these' => 'params'}).and_return(mock_artist(:save => false))
        post :create, :artist => {:these => 'params'}
        assigns(:artist).should equal(mock_artist)
      end

      it "should re-render the 'new' template" do
        Artist.stub!(:new).and_return(mock_artist(:save => false))
        post :create, :artist => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested artist" do
        Artist.should_receive(:find).with("37").and_return(mock_artist)
        mock_artist.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :artist => {:these => 'params'}
      end

      it "should expose the requested artist as @artist" do
        Artist.stub!(:find).and_return(mock_artist(:update_attributes => true))
        put :update, :id => "1"
        assigns(:artist).should equal(mock_artist)
      end

      it "should redirect to the artist" do
        Artist.stub!(:find).and_return(mock_artist(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(artist_url(mock_artist))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested artist" do
        Artist.should_receive(:find).with("37").and_return(mock_artist)
        mock_artist.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :artist => {:these => 'params'}
      end

      it "should expose the artist as @artist" do
        Artist.stub!(:find).and_return(mock_artist(:update_attributes => false))
        put :update, :id => "1"
        assigns(:artist).should equal(mock_artist)
      end

      it "should re-render the 'edit' template" do
        Artist.stub!(:find).and_return(mock_artist(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested artist" do
      Artist.should_receive(:find).with("37").and_return(mock_artist)
      mock_artist.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the artists list" do
      Artist.stub!(:find).and_return(mock_artist(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(artists_url)
    end

  end

end
