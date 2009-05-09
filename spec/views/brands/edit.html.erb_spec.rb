require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/brands/edit.html.erb" do
  include BrandsHelper
  
  before(:each) do
    assigns[:brand] = @brand = stub_model(Brand,
      :new_record? => false,
      :name => "value for name",
      :homepage => "value for homepage",
      :user => User.make
    )
  end

  it "should render edit form" do
    render "/brands/edit.html.erb"
    
    response.should have_tag("form[action=#{brand_path(@brand)}][method=post]") do
      with_tag('input#brand_name[name=?]', "brand[name]")
      with_tag('input#brand_homepage[name=?]', "brand[homepage]")
      with_tag('input#brand_user[name=?]', "brand[user]")
    end
  end
end


