require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ParticipationsController do

  def mock_participation(stubs={})
    @mock_participation ||= mock_model(Participation, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all participations as @participations" do
      Participation.should_receive(:find).with(:all).and_return([mock_participation])
      get :index
      assigns[:participations].should == [mock_participation]
    end

    describe "with mime type of xml" do
  
      it "should render all participations as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Participation.should_receive(:find).with(:all).and_return(participations = mock("Array of Participations"))
        participations.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested participation as @participation" do
      Participation.should_receive(:find).with("37").and_return(mock_participation)
      get :show, :id => "37"
      assigns[:participation].should equal(mock_participation)
    end
    
    describe "with mime type of xml" do

      it "should render the requested participation as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Participation.should_receive(:find).with("37").and_return(mock_participation)
        mock_participation.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new participation as @participation" do
      Participation.should_receive(:new).and_return(mock_participation)
      get :new
      assigns[:participation].should equal(mock_participation)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested participation as @participation" do
      Participation.should_receive(:find).with("37").and_return(mock_participation)
      get :edit, :id => "37"
      assigns[:participation].should equal(mock_participation)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created participation as @participation" do
        Participation.should_receive(:new).with({'these' => 'params'}).and_return(mock_participation(:save => true))
        post :create, :participation => {:these => 'params'}
        assigns(:participation).should equal(mock_participation)
      end

      it "should redirect to the created participation" do
        Participation.stub!(:new).and_return(mock_participation(:save => true))
        post :create, :participation => {}
        response.should redirect_to(participation_url(mock_participation))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved participation as @participation" do
        Participation.stub!(:new).with({'these' => 'params'}).and_return(mock_participation(:save => false))
        post :create, :participation => {:these => 'params'}
        assigns(:participation).should equal(mock_participation)
      end

      it "should re-render the 'new' template" do
        Participation.stub!(:new).and_return(mock_participation(:save => false))
        post :create, :participation => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested participation" do
        Participation.should_receive(:find).with("37").and_return(mock_participation)
        mock_participation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :participation => {:these => 'params'}
      end

      it "should expose the requested participation as @participation" do
        Participation.stub!(:find).and_return(mock_participation(:update_attributes => true))
        put :update, :id => "1"
        assigns(:participation).should equal(mock_participation)
      end

      it "should redirect to the participation" do
        Participation.stub!(:find).and_return(mock_participation(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(participation_url(mock_participation))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested participation" do
        Participation.should_receive(:find).with("37").and_return(mock_participation)
        mock_participation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :participation => {:these => 'params'}
      end

      it "should expose the participation as @participation" do
        Participation.stub!(:find).and_return(mock_participation(:update_attributes => false))
        put :update, :id => "1"
        assigns(:participation).should equal(mock_participation)
      end

      it "should re-render the 'edit' template" do
        Participation.stub!(:find).and_return(mock_participation(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested participation" do
      Participation.should_receive(:find).with("37").and_return(mock_participation)
      mock_participation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the participations list" do
      Participation.stub!(:find).and_return(mock_participation(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(participations_url)
    end

  end

end
