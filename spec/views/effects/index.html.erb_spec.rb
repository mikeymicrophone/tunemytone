require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/effects/index.html.erb" do
  include EffectsHelper
  
  before(:each) do
    assigns[:effects] = [
      stub_model(Effect,
        :name => "value for name",
        :brand => ,
        :user => 
      ),
      stub_model(Effect,
        :name => "value for name",
        :brand => ,
        :user => 
      )
    ]
  end

  it "should render list of effects" do
    render "/effects/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", , 2)
  end
end

