require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SoundsController do

  def mock_sound(stubs={})
    @mock_sound ||= mock_model(Sound, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all sounds as @sounds" do
      Sound.should_receive(:find).with(:all).and_return([mock_sound])
      get :index
      assigns[:sounds].should == [mock_sound]
    end

    describe "with mime type of xml" do
  
      it "should render all sounds as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Sound.should_receive(:find).with(:all).and_return(sounds = mock("Array of Sounds"))
        sounds.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested sound as @sound" do
      Sound.should_receive(:find).with("37").and_return(mock_sound)
      get :show, :id => "37"
      assigns[:sound].should equal(mock_sound)
    end
    
    describe "with mime type of xml" do

      it "should render the requested sound as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Sound.should_receive(:find).with("37").and_return(mock_sound)
        mock_sound.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new sound as @sound" do
      Sound.should_receive(:new).and_return(mock_sound)
      get :new
      assigns[:sound].should equal(mock_sound)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested sound as @sound" do
      Sound.should_receive(:find).with("37").and_return(mock_sound)
      get :edit, :id => "37"
      assigns[:sound].should equal(mock_sound)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created sound as @sound" do
        Sound.should_receive(:new).with({'these' => 'params'}).and_return(mock_sound(:save => true))
        post :create, :sound => {:these => 'params'}
        assigns(:sound).should equal(mock_sound)
      end

      it "should redirect to the created sound" do
        Sound.stub!(:new).and_return(mock_sound(:save => true))
        post :create, :sound => {}
        response.should redirect_to(sound_url(mock_sound))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved sound as @sound" do
        Sound.stub!(:new).with({'these' => 'params'}).and_return(mock_sound(:save => false))
        post :create, :sound => {:these => 'params'}
        assigns(:sound).should equal(mock_sound)
      end

      it "should re-render the 'new' template" do
        Sound.stub!(:new).and_return(mock_sound(:save => false))
        post :create, :sound => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested sound" do
        Sound.should_receive(:find).with("37").and_return(mock_sound)
        mock_sound.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sound => {:these => 'params'}
      end

      it "should expose the requested sound as @sound" do
        Sound.stub!(:find).and_return(mock_sound(:update_attributes => true))
        put :update, :id => "1"
        assigns(:sound).should equal(mock_sound)
      end

      it "should redirect to the sound" do
        Sound.stub!(:find).and_return(mock_sound(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(sound_url(mock_sound))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested sound" do
        Sound.should_receive(:find).with("37").and_return(mock_sound)
        mock_sound.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sound => {:these => 'params'}
      end

      it "should expose the sound as @sound" do
        Sound.stub!(:find).and_return(mock_sound(:update_attributes => false))
        put :update, :id => "1"
        assigns(:sound).should equal(mock_sound)
      end

      it "should re-render the 'edit' template" do
        Sound.stub!(:find).and_return(mock_sound(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested sound" do
      Sound.should_receive(:find).with("37").and_return(mock_sound)
      mock_sound.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the sounds list" do
      Sound.stub!(:find).and_return(mock_sound(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(sounds_url)
    end

  end

end
