require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/effects/new.html.erb" do
  include EffectsHelper
  
  before(:each) do
    assigns[:effect] = stub_model(Effect,
      :new_record? => true,
      :name => "value for name",
      :brand => ,
      :user => 
    )
  end

  it "should render new form" do
    render "/effects/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", effects_path) do
      with_tag("input#effect_name[name=?]", "effect[name]")
      with_tag("input#effect_brand[name=?]", "effect[brand]")
      with_tag("input#effect_user[name=?]", "effect[user]")
    end
  end
end


