require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sounds/show.html.erb" do
  include SoundsHelper
  
  before(:each) do
    assigns[:sound] = @sound = stub_model(Sound,
      :configuration => ,
      :example_type => "value for example_type",
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/sounds/show.html.erb"
    response.should have_text(//)
    response.should have_text(/value\ for\ example_type/)
    response.should have_text(//)
  end
end

