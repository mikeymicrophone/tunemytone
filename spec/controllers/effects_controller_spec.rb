require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EffectsController do

  def mock_effect(stubs={})
    @mock_effect ||= mock_model(Effect, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all effects as @effects" do
      Effect.should_receive(:find).with(:all).and_return([mock_effect])
      get :index
      assigns[:effects].should == [mock_effect]
    end

    describe "with mime type of xml" do
  
      it "should render all effects as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Effect.should_receive(:find).with(:all).and_return(effects = mock("Array of Effects"))
        effects.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested effect as @effect" do
      Effect.should_receive(:find).with("37").and_return(mock_effect)
      get :show, :id => "37"
      assigns[:effect].should equal(mock_effect)
    end
    
    describe "with mime type of xml" do

      it "should render the requested effect as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Effect.should_receive(:find).with("37").and_return(mock_effect)
        mock_effect.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new effect as @effect" do
      Effect.should_receive(:new).and_return(mock_effect)
      get :new
      assigns[:effect].should equal(mock_effect)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested effect as @effect" do
      Effect.should_receive(:find).with("37").and_return(mock_effect)
      get :edit, :id => "37"
      assigns[:effect].should equal(mock_effect)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created effect as @effect" do
        Effect.should_receive(:new).with({'these' => 'params'}).and_return(mock_effect(:save => true))
        post :create, :effect => {:these => 'params'}
        assigns(:effect).should equal(mock_effect)
      end

      it "should redirect to the created effect" do
        Effect.stub!(:new).and_return(mock_effect(:save => true))
        post :create, :effect => {}
        response.should redirect_to(effect_url(mock_effect))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved effect as @effect" do
        Effect.stub!(:new).with({'these' => 'params'}).and_return(mock_effect(:save => false))
        post :create, :effect => {:these => 'params'}
        assigns(:effect).should equal(mock_effect)
      end

      it "should re-render the 'new' template" do
        Effect.stub!(:new).and_return(mock_effect(:save => false))
        post :create, :effect => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested effect" do
        Effect.should_receive(:find).with("37").and_return(mock_effect)
        mock_effect.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :effect => {:these => 'params'}
      end

      it "should expose the requested effect as @effect" do
        Effect.stub!(:find).and_return(mock_effect(:update_attributes => true))
        put :update, :id => "1"
        assigns(:effect).should equal(mock_effect)
      end

      it "should redirect to the effect" do
        Effect.stub!(:find).and_return(mock_effect(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(effect_url(mock_effect))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested effect" do
        Effect.should_receive(:find).with("37").and_return(mock_effect)
        mock_effect.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :effect => {:these => 'params'}
      end

      it "should expose the effect as @effect" do
        Effect.stub!(:find).and_return(mock_effect(:update_attributes => false))
        put :update, :id => "1"
        assigns(:effect).should equal(mock_effect)
      end

      it "should re-render the 'edit' template" do
        Effect.stub!(:find).and_return(mock_effect(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested effect" do
      Effect.should_receive(:find).with("37").and_return(mock_effect)
      mock_effect.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the effects list" do
      Effect.stub!(:find).and_return(mock_effect(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(effects_url)
    end

  end

end
