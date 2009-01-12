require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/brands/show.html.erb" do
  include BrandsHelper
  
  before(:each) do
    assigns[:brand] = @brand = stub_model(Brand,
      :name => "value for name",
      :homepage => "value for homepage",
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/brands/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ homepage/)
    response.should have_text(//)
  end
end

