require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/settings/edit.html.erb" do
  include SettingsHelper
  
  before(:each) do
    assigns[:setting] = @setting = stub_model(Setting,
      :new_record? => false,
      :knob => Knob.make,
      :user => User.make,
      :value => "1"
    )
  end

  it "should render edit form" do
    render "/settings/edit.html.erb"
    
    response.should have_tag("form[action=#{setting_path(@setting)}][method=post]") do
      with_tag('input#setting_knob[name=?]', "setting[knob]")
      with_tag('input#setting_user[name=?]', "setting[user]")
      with_tag('input#setting_value[name=?]', "setting[value]")
    end
  end
end


