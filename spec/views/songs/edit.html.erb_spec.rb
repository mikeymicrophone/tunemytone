require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/songs/edit.html.erb" do
  include SongsHelper
  
  before(:each) do
    assigns[:song] = @song = stub_model(Song,
      :new_record? => false,
      :name => "value for name",
      :user => 
    )
  end

  it "should render edit form" do
    render "/songs/edit.html.erb"
    
    response.should have_tag("form[action=#{song_path(@song)}][method=post]") do
      with_tag('input#song_name[name=?]', "song[name]")
      with_tag('input#song_user[name=?]', "song[user]")
    end
  end
end


