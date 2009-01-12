require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/elements/edit.html.erb" do
  include ElementsHelper
  
  before(:each) do
    assigns[:element] = @element = stub_model(Element,
      :new_record? => false,
      :specification_type => "value for specification_type",
      :configuration => ,
      :user => 
    )
  end

  it "should render edit form" do
    render "/elements/edit.html.erb"
    
    response.should have_tag("form[action=#{element_path(@element)}][method=post]") do
      with_tag('input#element_specification_type[name=?]', "element[specification_type]")
      with_tag('input#element_configuration[name=?]', "element[configuration]")
      with_tag('input#element_user[name=?]', "element[user]")
    end
  end
end


