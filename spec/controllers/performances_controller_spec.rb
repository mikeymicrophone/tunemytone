require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PerformancesController do

  def mock_performance(stubs={})
    @mock_performance ||= mock_model(Performance, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all performances as @performances" do
      Performance.should_receive(:find).with(:all).and_return([mock_performance])
      get :index
      assigns[:performances].should == [mock_performance]
    end

    describe "with mime type of xml" do
  
      it "should render all performances as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Performance.should_receive(:find).with(:all).and_return(performances = mock("Array of Performances"))
        performances.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested performance as @performance" do
      Performance.should_receive(:find).with("37").and_return(mock_performance)
      get :show, :id => "37"
      assigns[:performance].should equal(mock_performance)
    end
    
    describe "with mime type of xml" do

      it "should render the requested performance as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Performance.should_receive(:find).with("37").and_return(mock_performance)
        mock_performance.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new performance as @performance" do
      Performance.should_receive(:new).and_return(mock_performance)
      get :new
      assigns[:performance].should equal(mock_performance)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested performance as @performance" do
      Performance.should_receive(:find).with("37").and_return(mock_performance)
      get :edit, :id => "37"
      assigns[:performance].should equal(mock_performance)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created performance as @performance" do
        Performance.should_receive(:new).with({'these' => 'params'}).and_return(mock_performance(:save => true))
        post :create, :performance => {:these => 'params'}
        assigns(:performance).should equal(mock_performance)
      end

      it "should redirect to the created performance" do
        Performance.stub!(:new).and_return(mock_performance(:save => true))
        post :create, :performance => {}
        response.should redirect_to(performance_url(mock_performance))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved performance as @performance" do
        Performance.stub!(:new).with({'these' => 'params'}).and_return(mock_performance(:save => false))
        post :create, :performance => {:these => 'params'}
        assigns(:performance).should equal(mock_performance)
      end

      it "should re-render the 'new' template" do
        Performance.stub!(:new).and_return(mock_performance(:save => false))
        post :create, :performance => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested performance" do
        Performance.should_receive(:find).with("37").and_return(mock_performance)
        mock_performance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :performance => {:these => 'params'}
      end

      it "should expose the requested performance as @performance" do
        Performance.stub!(:find).and_return(mock_performance(:update_attributes => true))
        put :update, :id => "1"
        assigns(:performance).should equal(mock_performance)
      end

      it "should redirect to the performance" do
        Performance.stub!(:find).and_return(mock_performance(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(performance_url(mock_performance))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested performance" do
        Performance.should_receive(:find).with("37").and_return(mock_performance)
        mock_performance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :performance => {:these => 'params'}
      end

      it "should expose the performance as @performance" do
        Performance.stub!(:find).and_return(mock_performance(:update_attributes => false))
        put :update, :id => "1"
        assigns(:performance).should equal(mock_performance)
      end

      it "should re-render the 'edit' template" do
        Performance.stub!(:find).and_return(mock_performance(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested performance" do
      Performance.should_receive(:find).with("37").and_return(mock_performance)
      mock_performance.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the performances list" do
      Performance.stub!(:find).and_return(mock_performance(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(performances_url)
    end

  end

end
