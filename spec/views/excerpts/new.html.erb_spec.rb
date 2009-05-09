require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/excerpts/new.html.erb" do
  include ExcerptsHelper
  
  before(:each) do
    assigns[:excerpt] = stub_model(Excerpt,
      :new_record? => true,
      :context_type => "value for context_type",
      :description => "value for description",
      :user => User.make
    )
  end

  it "should render new form" do
    render "/excerpts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", excerpts_path) do
      with_tag("input#excerpt_context_type[name=?]", "excerpt[context_type]")
      with_tag("input#excerpt_description[name=?]", "excerpt[description]")
      with_tag("input#excerpt_user[name=?]", "excerpt[user]")
    end
  end
end


