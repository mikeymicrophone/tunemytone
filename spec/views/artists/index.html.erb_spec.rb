require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/artists/index.html.erb" do
  include ArtistsHelper
  
  before(:each) do
    assigns[:artists] = [
      stub_model(Artist,
        :name => "value for name",
        :user => 
      ),
      stub_model(Artist,
        :name => "value for name",
        :user => 
      )
    ]
  end

  it "should render list of artists" do
    render "/artists/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", , 2)
  end
end

