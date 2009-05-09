require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bands/edit.html.erb" do
  include BandsHelper
  
  before(:each) do
    assigns[:band] = @band = stub_model(Band,
      :new_record? => false,
      :name => "value for name",
      :user => User.make
    )
  end

  it "should render edit form" do
    render "/bands/edit.html.erb"
    
    response.should have_tag("form[action=#{band_path(@band)}][method=post]") do
      with_tag('input#band_name[name=?]', "band[name]")
      with_tag('input#band_user[name=?]', "band[user]")
    end
  end
end


