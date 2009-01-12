require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/artists/new.html.erb" do
  include ArtistsHelper
  
  before(:each) do
    assigns[:artist] = stub_model(Artist,
      :new_record? => true,
      :name => "value for name",
      :user => 
    )
  end

  it "should render new form" do
    render "/artists/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", artists_path) do
      with_tag("input#artist_name[name=?]", "artist[name]")
      with_tag("input#artist_user[name=?]", "artist[user]")
    end
  end
end


