require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/songs/show.html.erb" do
  include SongsHelper
  
  before(:each) do
    assigns[:song] = @song = stub_model(Song,
      :name => "value for name",
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/songs/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
  end
end

