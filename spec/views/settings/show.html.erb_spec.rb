require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/settings/show.html.erb" do
  include SettingsHelper
  
  before(:each) do
    assigns[:setting] = @setting = stub_model(Setting,
      :knob => Knob.make,
      :user => User.make,
      :value => "1"
    )
  end

  it "should render attributes in <p>" do
    render "/settings/show.html.erb"
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(/1/)
  end
end

