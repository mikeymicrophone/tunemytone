require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/configurations/new.html.erb" do
  include ConfigurationsHelper
  
  before(:each) do
    assigns[:configuration] = stub_model(Configuration,
      :new_record? => true,
      :name => "value for name",
      :user => User.make
    )
  end

  it "should render new form" do
    render "/configurations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", configurations_path) do
      with_tag("input#configuration_name[name=?]", "configuration[name]")
      with_tag("input#configuration_user[name=?]", "configuration[user]")
    end
  end
end


