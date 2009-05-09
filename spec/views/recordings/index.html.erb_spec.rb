require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/recordings/index.html.erb" do
  include RecordingsHelper
  
  before(:each) do
    assigns[:recordings] = [
      stub_model(Recording,
        :name => "value for name",
        :excerpt => Excerpt.make,
        :user => User.make
      ),
      stub_model(Recording,
        :name => "value for name",
        :excerpt => Excerpt.make,
        :user => User.make
      )
    ]
  end

  it "should render list of recordings" do
    render "/recordings/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", 'long', 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

