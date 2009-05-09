require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/artists/show.html.erb" do
  include ArtistsHelper
  
  before(:each) do
    assigns[:artist] = @artist = stub_model(Artist,
      :name => "value for name",
      :user => User.make
    )
  end

  it "should render attributes in <p>" do
    render "/artists/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
  end
end

