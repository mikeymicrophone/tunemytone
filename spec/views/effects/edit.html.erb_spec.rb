require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/effects/edit.html.erb" do
  include EffectsHelper
  
  before(:each) do
    assigns[:effect] = @effect = stub_model(Effect,
      :new_record? => false,
      :name => "value for name",
      :brand => ,
      :user => 
    )
  end

  it "should render edit form" do
    render "/effects/edit.html.erb"
    
    response.should have_tag("form[action=#{effect_path(@effect)}][method=post]") do
      with_tag('input#effect_name[name=?]', "effect[name]")
      with_tag('input#effect_brand[name=?]', "effect[brand]")
      with_tag('input#effect_user[name=?]', "effect[user]")
    end
  end
end


