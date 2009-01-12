require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExcerptsController do

  def mock_excerpt(stubs={})
    @mock_excerpt ||= mock_model(Excerpt, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all excerpts as @excerpts" do
      Excerpt.should_receive(:find).with(:all).and_return([mock_excerpt])
      get :index
      assigns[:excerpts].should == [mock_excerpt]
    end

    describe "with mime type of xml" do
  
      it "should render all excerpts as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Excerpt.should_receive(:find).with(:all).and_return(excerpts = mock("Array of Excerpts"))
        excerpts.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested excerpt as @excerpt" do
      Excerpt.should_receive(:find).with("37").and_return(mock_excerpt)
      get :show, :id => "37"
      assigns[:excerpt].should equal(mock_excerpt)
    end
    
    describe "with mime type of xml" do

      it "should render the requested excerpt as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Excerpt.should_receive(:find).with("37").and_return(mock_excerpt)
        mock_excerpt.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new excerpt as @excerpt" do
      Excerpt.should_receive(:new).and_return(mock_excerpt)
      get :new
      assigns[:excerpt].should equal(mock_excerpt)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested excerpt as @excerpt" do
      Excerpt.should_receive(:find).with("37").and_return(mock_excerpt)
      get :edit, :id => "37"
      assigns[:excerpt].should equal(mock_excerpt)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created excerpt as @excerpt" do
        Excerpt.should_receive(:new).with({'these' => 'params'}).and_return(mock_excerpt(:save => true))
        post :create, :excerpt => {:these => 'params'}
        assigns(:excerpt).should equal(mock_excerpt)
      end

      it "should redirect to the created excerpt" do
        Excerpt.stub!(:new).and_return(mock_excerpt(:save => true))
        post :create, :excerpt => {}
        response.should redirect_to(excerpt_url(mock_excerpt))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved excerpt as @excerpt" do
        Excerpt.stub!(:new).with({'these' => 'params'}).and_return(mock_excerpt(:save => false))
        post :create, :excerpt => {:these => 'params'}
        assigns(:excerpt).should equal(mock_excerpt)
      end

      it "should re-render the 'new' template" do
        Excerpt.stub!(:new).and_return(mock_excerpt(:save => false))
        post :create, :excerpt => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested excerpt" do
        Excerpt.should_receive(:find).with("37").and_return(mock_excerpt)
        mock_excerpt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :excerpt => {:these => 'params'}
      end

      it "should expose the requested excerpt as @excerpt" do
        Excerpt.stub!(:find).and_return(mock_excerpt(:update_attributes => true))
        put :update, :id => "1"
        assigns(:excerpt).should equal(mock_excerpt)
      end

      it "should redirect to the excerpt" do
        Excerpt.stub!(:find).and_return(mock_excerpt(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(excerpt_url(mock_excerpt))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested excerpt" do
        Excerpt.should_receive(:find).with("37").and_return(mock_excerpt)
        mock_excerpt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :excerpt => {:these => 'params'}
      end

      it "should expose the excerpt as @excerpt" do
        Excerpt.stub!(:find).and_return(mock_excerpt(:update_attributes => false))
        put :update, :id => "1"
        assigns(:excerpt).should equal(mock_excerpt)
      end

      it "should re-render the 'edit' template" do
        Excerpt.stub!(:find).and_return(mock_excerpt(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested excerpt" do
      Excerpt.should_receive(:find).with("37").and_return(mock_excerpt)
      mock_excerpt.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the excerpts list" do
      Excerpt.stub!(:find).and_return(mock_excerpt(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(excerpts_url)
    end

  end

end
