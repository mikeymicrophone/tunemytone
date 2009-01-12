require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/venues/edit.html.erb" do
  include VenuesHelper
  
  before(:each) do
    assigns[:venue] = @venue = stub_model(Venue,
      :new_record? => false,
      :name => "value for name",
      :address => "value for address",
      :line2 => "value for line2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip",
      :country => "value for country"
    )
  end

  it "should render edit form" do
    render "/venues/edit.html.erb"
    
    response.should have_tag("form[action=#{venue_path(@venue)}][method=post]") do
      with_tag('input#venue_name[name=?]', "venue[name]")
      with_tag('input#venue_address[name=?]', "venue[address]")
      with_tag('input#venue_line2[name=?]', "venue[line2]")
      with_tag('input#venue_city[name=?]', "venue[city]")
      with_tag('input#venue_state[name=?]', "venue[state]")
      with_tag('input#venue_zip[name=?]', "venue[zip]")
      with_tag('input#venue_country[name=?]', "venue[country]")
    end
  end
end


