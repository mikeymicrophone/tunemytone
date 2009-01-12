require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sounds/new.html.erb" do
  include SoundsHelper
  
  before(:each) do
    assigns[:sound] = stub_model(Sound,
      :new_record? => true,
      :configuration => ,
      :example_type => "value for example_type",
      :user => 
    )
  end

  it "should render new form" do
    render "/sounds/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", sounds_path) do
      with_tag("input#sound_configuration[name=?]", "sound[configuration]")
      with_tag("input#sound_example_type[name=?]", "sound[example_type]")
      with_tag("input#sound_user[name=?]", "sound[user]")
    end
  end
end


