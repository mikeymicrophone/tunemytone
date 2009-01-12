require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/albums/index.html.erb" do
  include AlbumsHelper
  
  before(:each) do
    assigns[:albums] = [
      stub_model(Album,
        :name => "value for name",
        :performer_type => "value for performer_type",
        :user => 
      ),
      stub_model(Album,
        :name => "value for name",
        :performer_type => "value for performer_type",
        :user => 
      )
    ]
  end

  it "should render list of albums" do
    render "/albums/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for performer_type", 2)
    response.should have_tag("tr>td", , 2)
  end
end

