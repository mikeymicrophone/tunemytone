require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/albums/new.html.erb" do
  include AlbumsHelper
  
  before(:each) do
    assigns[:album] = stub_model(Album,
      :new_record? => true,
      :name => "value for name",
      :performer_type => "value for performer_type",
      :user => 
    )
  end

  it "should render new form" do
    render "/albums/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", albums_path) do
      with_tag("input#album_name[name=?]", "album[name]")
      with_tag("input#album_performer_type[name=?]", "album[performer_type]")
      with_tag("input#album_user[name=?]", "album[user]")
    end
  end
end


