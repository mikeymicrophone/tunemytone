require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/elements/index.html.erb" do
  include ElementsHelper
  
  before(:each) do
    assigns[:elements] = [
      stub_model(Element,
        :specification_type => "value for specification_type",
        :configuration => ,
        :user => 
      ),
      stub_model(Element,
        :specification_type => "value for specification_type",
        :configuration => ,
        :user => 
      )
    ]
  end

  it "should render list of elements" do
    render "/elements/index.html.erb"
    response.should have_tag("tr>td", "value for specification_type", 2)
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", , 2)
  end
end

