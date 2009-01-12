require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ConnectionsController do

  def mock_connection(stubs={})
    @mock_connection ||= mock_model(Connection, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all connections as @connections" do
      Connection.should_receive(:find).with(:all).and_return([mock_connection])
      get :index
      assigns[:connections].should == [mock_connection]
    end

    describe "with mime type of xml" do
  
      it "should render all connections as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Connection.should_receive(:find).with(:all).and_return(connections = mock("Array of Connections"))
        connections.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested connection as @connection" do
      Connection.should_receive(:find).with("37").and_return(mock_connection)
      get :show, :id => "37"
      assigns[:connection].should equal(mock_connection)
    end
    
    describe "with mime type of xml" do

      it "should render the requested connection as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Connection.should_receive(:find).with("37").and_return(mock_connection)
        mock_connection.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new connection as @connection" do
      Connection.should_receive(:new).and_return(mock_connection)
      get :new
      assigns[:connection].should equal(mock_connection)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested connection as @connection" do
      Connection.should_receive(:find).with("37").and_return(mock_connection)
      get :edit, :id => "37"
      assigns[:connection].should equal(mock_connection)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created connection as @connection" do
        Connection.should_receive(:new).with({'these' => 'params'}).and_return(mock_connection(:save => true))
        post :create, :connection => {:these => 'params'}
        assigns(:connection).should equal(mock_connection)
      end

      it "should redirect to the created connection" do
        Connection.stub!(:new).and_return(mock_connection(:save => true))
        post :create, :connection => {}
        response.should redirect_to(connection_url(mock_connection))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved connection as @connection" do
        Connection.stub!(:new).with({'these' => 'params'}).and_return(mock_connection(:save => false))
        post :create, :connection => {:these => 'params'}
        assigns(:connection).should equal(mock_connection)
      end

      it "should re-render the 'new' template" do
        Connection.stub!(:new).and_return(mock_connection(:save => false))
        post :create, :connection => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested connection" do
        Connection.should_receive(:find).with("37").and_return(mock_connection)
        mock_connection.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :connection => {:these => 'params'}
      end

      it "should expose the requested connection as @connection" do
        Connection.stub!(:find).and_return(mock_connection(:update_attributes => true))
        put :update, :id => "1"
        assigns(:connection).should equal(mock_connection)
      end

      it "should redirect to the connection" do
        Connection.stub!(:find).and_return(mock_connection(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(connection_url(mock_connection))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested connection" do
        Connection.should_receive(:find).with("37").and_return(mock_connection)
        mock_connection.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :connection => {:these => 'params'}
      end

      it "should expose the connection as @connection" do
        Connection.stub!(:find).and_return(mock_connection(:update_attributes => false))
        put :update, :id => "1"
        assigns(:connection).should equal(mock_connection)
      end

      it "should re-render the 'edit' template" do
        Connection.stub!(:find).and_return(mock_connection(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested connection" do
      Connection.should_receive(:find).with("37").and_return(mock_connection)
      mock_connection.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the connections list" do
      Connection.stub!(:find).and_return(mock_connection(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(connections_url)
    end

  end

end
