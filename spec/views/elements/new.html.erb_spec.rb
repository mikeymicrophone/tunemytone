require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/elements/new.html.erb" do
  include ElementsHelper
  
  before(:each) do
    assigns[:element] = stub_model(Element,
      :new_record? => true,
      :specification_type => "value for specification_type",
      :configuration => ,
      :user => 
    )
  end

  it "should render new form" do
    render "/elements/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", elements_path) do
      with_tag("input#element_specification_type[name=?]", "element[specification_type]")
      with_tag("input#element_configuration[name=?]", "element[configuration]")
      with_tag("input#element_user[name=?]", "element[user]")
    end
  end
end


