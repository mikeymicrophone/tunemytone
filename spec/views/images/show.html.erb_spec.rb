require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/show.html.erb" do
  include ImagesHelper
  
  before(:each) do
    assigns[:image] = @image = stub_model(Image,
      :name => "value for name",
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/images/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
  end
end

