require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/recordings/show.html.erb" do
  include RecordingsHelper
  
  before(:each) do
    assigns[:recording] = @recording = stub_model(Recording,
      :name => "value for name",
      :excerpt => Excerpt.make,
      :user => User.make
    )
  end

  it "should render attributes in <p>" do
    render "/recordings/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
    response.should have_text(//)
  end
end

