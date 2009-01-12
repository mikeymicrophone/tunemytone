require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/elements/show.html.erb" do
  include ElementsHelper
  
  before(:each) do
    assigns[:element] = @element = stub_model(Element,
      :specification_type => "value for specification_type",
      :configuration => ,
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/elements/show.html.erb"
    response.should have_text(/value\ for\ specification_type/)
    response.should have_text(//)
    response.should have_text(//)
  end
end

