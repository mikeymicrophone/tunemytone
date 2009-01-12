require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/songs/index.html.erb" do
  include SongsHelper
  
  before(:each) do
    assigns[:songs] = [
      stub_model(Song,
        :name => "value for name",
        :user => 
      ),
      stub_model(Song,
        :name => "value for name",
        :user => 
      )
    ]
  end

  it "should render list of songs" do
    render "/songs/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", , 2)
  end
end

