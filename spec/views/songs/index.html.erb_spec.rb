require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/songs/index.html.erb" do
  include SongsHelper
  
  before(:each) do
    assigns[:songs] = [
      stub_model(Song,
        :name => "value for name",
        :user => User.make
      ),
      stub_model(Song,
        :name => "value for name",
        :user => User.make
      )
    ]
  end

  it "should render list of songs" do
    render "/songs/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

