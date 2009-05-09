require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/index.html.erb" do
  include ImagesHelper
  
  before(:each) do
    assigns[:images] = [
      stub_model(Image,
        :name => "value for name",
        :user => User.make
      ),
      stub_model(Image,
        :name => "value for name",
        :user => User.make
      )
    ]
  end

  it "should render list of images" do
    render "/images/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

