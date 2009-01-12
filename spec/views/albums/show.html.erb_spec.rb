require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/albums/show.html.erb" do
  include AlbumsHelper
  
  before(:each) do
    assigns[:album] = @album = stub_model(Album,
      :name => "value for name",
      :performer_type => "value for performer_type",
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/albums/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ performer_type/)
    response.should have_text(//)
  end
end

