require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/shows/index.html.erb" do
  include ShowsHelper
  
  before(:each) do
    assigns[:shows] = [
      stub_model(Show,
        :venue => ,
        :performer_type => "value for performer_type",
      ),
      stub_model(Show,
        :venue => ,
        :performer_type => "value for performer_type",
      )
    ]
  end

  it "should render list of shows" do
    render "/shows/index.html.erb"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", "value for performer_type", 2)
  end
end

