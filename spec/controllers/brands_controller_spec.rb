require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BrandsController do

  def mock_brand(stubs={})
    @mock_brand ||= mock_model(Brand, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all brands as @brands" do
      Brand.should_receive(:find).with(:all).and_return([mock_brand])
      get :index
      assigns[:brands].should == [mock_brand]
    end

    describe "with mime type of xml" do
  
      it "should render all brands as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Brand.should_receive(:find).with(:all).and_return(brands = mock("Array of Brands"))
        brands.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested brand as @brand" do
      Brand.should_receive(:find).with("37").and_return(mock_brand)
      get :show, :id => "37"
      assigns[:brand].should equal(mock_brand)
    end
    
    describe "with mime type of xml" do

      it "should render the requested brand as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Brand.should_receive(:find).with("37").and_return(mock_brand)
        mock_brand.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new brand as @brand" do
      Brand.should_receive(:new).and_return(mock_brand)
      get :new
      assigns[:brand].should equal(mock_brand)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested brand as @brand" do
      Brand.should_receive(:find).with("37").and_return(mock_brand)
      get :edit, :id => "37"
      assigns[:brand].should equal(mock_brand)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created brand as @brand" do
        Brand.should_receive(:new).with({'these' => 'params'}).and_return(mock_brand(:save => true))
        post :create, :brand => {:these => 'params'}
        assigns(:brand).should equal(mock_brand)
      end

      it "should redirect to the created brand" do
        Brand.stub!(:new).and_return(mock_brand(:save => true))
        post :create, :brand => {}
        response.should redirect_to(brand_url(mock_brand))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved brand as @brand" do
        Brand.stub!(:new).with({'these' => 'params'}).and_return(mock_brand(:save => false))
        post :create, :brand => {:these => 'params'}
        assigns(:brand).should equal(mock_brand)
      end

      it "should re-render the 'new' template" do
        Brand.stub!(:new).and_return(mock_brand(:save => false))
        post :create, :brand => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested brand" do
        Brand.should_receive(:find).with("37").and_return(mock_brand)
        mock_brand.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :brand => {:these => 'params'}
      end

      it "should expose the requested brand as @brand" do
        Brand.stub!(:find).and_return(mock_brand(:update_attributes => true))
        put :update, :id => "1"
        assigns(:brand).should equal(mock_brand)
      end

      it "should redirect to the brand" do
        Brand.stub!(:find).and_return(mock_brand(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(brand_url(mock_brand))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested brand" do
        Brand.should_receive(:find).with("37").and_return(mock_brand)
        mock_brand.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :brand => {:these => 'params'}
      end

      it "should expose the brand as @brand" do
        Brand.stub!(:find).and_return(mock_brand(:update_attributes => false))
        put :update, :id => "1"
        assigns(:brand).should equal(mock_brand)
      end

      it "should re-render the 'edit' template" do
        Brand.stub!(:find).and_return(mock_brand(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested brand" do
      Brand.should_receive(:find).with("37").and_return(mock_brand)
      mock_brand.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the brands list" do
      Brand.stub!(:find).and_return(mock_brand(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(brands_url)
    end

  end

end
