require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/effects/show.html.erb" do
  include EffectsHelper
  
  before(:each) do
    assigns[:effect] = @effect = stub_model(Effect,
      :name => "value for name",
      :brand => Brand.make,
      :user => User.make
    )
  end

  it "should render attributes in <p>" do
    render "/effects/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
    response.should have_text(//)
  end
end

