require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/recordings/edit.html.erb" do
  include RecordingsHelper
  
  before(:each) do
    assigns[:recording] = @recording = stub_model(Recording,
      :new_record? => false,
      :name => "value for name",
      :excerpt => ,
      :user => 
    )
  end

  it "should render edit form" do
    render "/recordings/edit.html.erb"
    
    response.should have_tag("form[action=#{recording_path(@recording)}][method=post]") do
      with_tag('input#recording_name[name=?]', "recording[name]")
      with_tag('input#recording_excerpt[name=?]', "recording[excerpt]")
      with_tag('input#recording_user[name=?]', "recording[user]")
    end
  end
end


