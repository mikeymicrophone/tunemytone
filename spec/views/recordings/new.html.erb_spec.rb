require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/recordings/new.html.erb" do
  include RecordingsHelper
  
  before(:each) do
    assigns[:recording] = stub_model(Recording,
      :new_record? => true,
      :name => "value for name",
      :excerpt => Excerpt.make,
      :user => User.make
    )
  end

  it "should render new form" do
    render "/recordings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", recordings_path) do
      with_tag("input#recording_name[name=?]", "recording[name]")
      with_tag("input#recording_excerpt[name=?]", "recording[excerpt]")
      with_tag("input#recording_user[name=?]", "recording[user]")
    end
  end
end


