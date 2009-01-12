require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/artists/edit.html.erb" do
  include ArtistsHelper
  
  before(:each) do
    assigns[:artist] = @artist = stub_model(Artist,
      :new_record? => false,
      :name => "value for name",
      :user => 
    )
  end

  it "should render edit form" do
    render "/artists/edit.html.erb"
    
    response.should have_tag("form[action=#{artist_path(@artist)}][method=post]") do
      with_tag('input#artist_name[name=?]', "artist[name]")
      with_tag('input#artist_user[name=?]', "artist[user]")
    end
  end
end


