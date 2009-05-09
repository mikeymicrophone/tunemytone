require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/shows/new.html.erb" do
  include ShowsHelper
  
  before(:each) do
    assigns[:show] = stub_model(Show,
      :new_record? => true,
      :venue => Venue.make,
      :performer_type => "value for performer_type"
    )
  end

  it "should render new form" do
    render "/shows/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", shows_path) do
      with_tag("input#show_venue[name=?]", "show[venue]")
      with_tag("input#show_performer_type[name=?]", "show[performer_type]")
    end
  end
end


