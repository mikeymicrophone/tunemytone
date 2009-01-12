require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/brands/new.html.erb" do
  include BrandsHelper
  
  before(:each) do
    assigns[:brand] = stub_model(Brand,
      :new_record? => true,
      :name => "value for name",
      :homepage => "value for homepage",
      :user => 
    )
  end

  it "should render new form" do
    render "/brands/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", brands_path) do
      with_tag("input#brand_name[name=?]", "brand[name]")
      with_tag("input#brand_homepage[name=?]", "brand[homepage]")
      with_tag("input#brand_user[name=?]", "brand[user]")
    end
  end
end


