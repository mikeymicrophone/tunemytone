require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/songs/new.html.erb" do
  include SongsHelper
  
  before(:each) do
    assigns[:song] = stub_model(Song,
      :new_record? => true,
      :name => "value for name",
      :user => User.make
    )
  end

  it "should render new form" do
    render "/songs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", songs_path) do
      with_tag("input#song_name[name=?]", "song[name]")
      with_tag("input#song_user[name=?]", "song[user]")
    end
  end
end


