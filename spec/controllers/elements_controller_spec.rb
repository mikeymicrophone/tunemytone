require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ElementsController do

  def mock_element(stubs={})
    @mock_element ||= mock_model(Element, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all elements as @elements" do
      Element.should_receive(:find).with(:all).and_return([mock_element])
      get :index
      assigns[:elements].should == [mock_element]
    end

    describe "with mime type of xml" do
  
      it "should render all elements as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Element.should_receive(:find).with(:all).and_return(elements = mock("Array of Elements"))
        elements.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested element as @element" do
      Element.should_receive(:find).with("37").and_return(mock_element)
      get :show, :id => "37"
      assigns[:element].should equal(mock_element)
    end
    
    describe "with mime type of xml" do

      it "should render the requested element as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Element.should_receive(:find).with("37").and_return(mock_element)
        mock_element.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new element as @element" do
      Element.should_receive(:new).and_return(mock_element)
      get :new
      assigns[:element].should equal(mock_element)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested element as @element" do
      Element.should_receive(:find).with("37").and_return(mock_element)
      get :edit, :id => "37"
      assigns[:element].should equal(mock_element)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created element as @element" do
        Element.should_receive(:new).with({'these' => 'params'}).and_return(mock_element(:save => true))
        post :create, :element => {:these => 'params'}
        assigns(:element).should equal(mock_element)
      end

      it "should redirect to the created element" do
        Element.stub!(:new).and_return(mock_element(:save => true))
        post :create, :element => {}
        response.should redirect_to(element_url(mock_element))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved element as @element" do
        Element.stub!(:new).with({'these' => 'params'}).and_return(mock_element(:save => false))
        post :create, :element => {:these => 'params'}
        assigns(:element).should equal(mock_element)
      end

      it "should re-render the 'new' template" do
        Element.stub!(:new).and_return(mock_element(:save => false))
        post :create, :element => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested element" do
        Element.should_receive(:find).with("37").and_return(mock_element)
        mock_element.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :element => {:these => 'params'}
      end

      it "should expose the requested element as @element" do
        Element.stub!(:find).and_return(mock_element(:update_attributes => true))
        put :update, :id => "1"
        assigns(:element).should equal(mock_element)
      end

      it "should redirect to the element" do
        Element.stub!(:find).and_return(mock_element(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(element_url(mock_element))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested element" do
        Element.should_receive(:find).with("37").and_return(mock_element)
        mock_element.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :element => {:these => 'params'}
      end

      it "should expose the element as @element" do
        Element.stub!(:find).and_return(mock_element(:update_attributes => false))
        put :update, :id => "1"
        assigns(:element).should equal(mock_element)
      end

      it "should re-render the 'edit' template" do
        Element.stub!(:find).and_return(mock_element(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested element" do
      Element.should_receive(:find).with("37").and_return(mock_element)
      mock_element.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the elements list" do
      Element.stub!(:find).and_return(mock_element(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(elements_url)
    end

  end

end
