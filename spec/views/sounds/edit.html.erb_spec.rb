require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sounds/edit.html.erb" do
  include SoundsHelper
  
  before(:each) do
    assigns[:sound] = @sound = stub_model(Sound,
      :new_record? => false,
      :configuration => ,
      :example_type => "value for example_type",
      :user => 
    )
  end

  it "should render edit form" do
    render "/sounds/edit.html.erb"
    
    response.should have_tag("form[action=#{sound_path(@sound)}][method=post]") do
      with_tag('input#sound_configuration[name=?]', "sound[configuration]")
      with_tag('input#sound_example_type[name=?]', "sound[example_type]")
      with_tag('input#sound_user[name=?]', "sound[user]")
    end
  end
end


