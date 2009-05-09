require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bands/new.html.erb" do
  include BandsHelper
  
  before(:each) do
    assigns[:band] = stub_model(Band,
      :new_record? => true,
      :name => "value for name",
      :user => User.make
    )
  end

  it "should render new form" do
    render "/bands/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", bands_path) do
      with_tag("input#band_name[name=?]", "band[name]")
      with_tag("input#band_user[name=?]", "band[user]")
    end
  end
end


