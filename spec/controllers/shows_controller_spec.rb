require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShowsController do

  def mock_show(stubs={})
    @mock_show ||= mock_model(Show, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all shows as @shows" do
      Show.should_receive(:find).with(:all).and_return([mock_show])
      get :index
      assigns[:shows].should == [mock_show]
    end

    describe "with mime type of xml" do
  
      it "should render all shows as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Show.should_receive(:find).with(:all).and_return(shows = mock("Array of Shows"))
        shows.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested show as @show" do
      Show.should_receive(:find).with("37").and_return(mock_show)
      get :show, :id => "37"
      assigns[:show].should equal(mock_show)
    end
    
    describe "with mime type of xml" do

      it "should render the requested show as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Show.should_receive(:find).with("37").and_return(mock_show)
        mock_show.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new show as @show" do
      Show.should_receive(:new).and_return(mock_show)
      get :new
      assigns[:show].should equal(mock_show)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested show as @show" do
      Show.should_receive(:find).with("37").and_return(mock_show)
      get :edit, :id => "37"
      assigns[:show].should equal(mock_show)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created show as @show" do
        Show.should_receive(:new).with({'these' => 'params'}).and_return(mock_show(:save => true))
        post :create, :show => {:these => 'params'}
        assigns(:show).should equal(mock_show)
      end

      it "should redirect to the created show" do
        Show.stub!(:new).and_return(mock_show(:save => true))
        post :create, :show => {}
        response.should redirect_to(show_url(mock_show))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved show as @show" do
        Show.stub!(:new).with({'these' => 'params'}).and_return(mock_show(:save => false))
        post :create, :show => {:these => 'params'}
        assigns(:show).should equal(mock_show)
      end

      it "should re-render the 'new' template" do
        Show.stub!(:new).and_return(mock_show(:save => false))
        post :create, :show => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested show" do
        Show.should_receive(:find).with("37").and_return(mock_show)
        mock_show.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :show => {:these => 'params'}
      end

      it "should expose the requested show as @show" do
        Show.stub!(:find).and_return(mock_show(:update_attributes => true))
        put :update, :id => "1"
        assigns(:show).should equal(mock_show)
      end

      it "should redirect to the show" do
        Show.stub!(:find).and_return(mock_show(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(show_url(mock_show))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested show" do
        Show.should_receive(:find).with("37").and_return(mock_show)
        mock_show.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :show => {:these => 'params'}
      end

      it "should expose the show as @show" do
        Show.stub!(:find).and_return(mock_show(:update_attributes => false))
        put :update, :id => "1"
        assigns(:show).should equal(mock_show)
      end

      it "should re-render the 'edit' template" do
        Show.stub!(:find).and_return(mock_show(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested show" do
      Show.should_receive(:find).with("37").and_return(mock_show)
      mock_show.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the shows list" do
      Show.stub!(:find).and_return(mock_show(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(shows_url)
    end

  end

end
