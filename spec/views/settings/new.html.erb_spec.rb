require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/settings/new.html.erb" do
  include SettingsHelper
  
  before(:each) do
    assigns[:setting] = stub_model(Setting,
      :new_record? => true,
      :knob => Knob.make,
      :user => User.make,
      :value => "1"
    )
  end

  it "should render new form" do
    render "/settings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", settings_path) do
      with_tag("input#setting_knob[name=?]", "setting[knob]")
      with_tag("input#setting_user[name=?]", "setting[user]")
      with_tag("input#setting_value[name=?]", "setting[value]")
    end
  end
end


