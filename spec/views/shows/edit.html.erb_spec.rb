require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/shows/edit.html.erb" do
  include ShowsHelper
  
  before(:each) do
    assigns[:show] = @show = stub_model(Show,
      :new_record? => false,
      :venue => ,
      :performer_type => "value for performer_type",
    )
  end

  it "should render edit form" do
    render "/shows/edit.html.erb"
    
    response.should have_tag("form[action=#{show_path(@show)}][method=post]") do
      with_tag('input#show_venue[name=?]', "show[venue]")
      with_tag('input#show_performer_type[name=?]', "show[performer_type]")
    end
  end
end


