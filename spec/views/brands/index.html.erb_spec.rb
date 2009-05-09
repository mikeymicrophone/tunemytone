require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/brands/index.html.erb" do
  include BrandsHelper
  
  before(:each) do
    assigns[:brands] = [
      stub_model(Brand,
        :name => "value for name",
        :homepage => "value for homepage",
        :user => User.make
      ),
      stub_model(Brand,
        :name => "value for name",
        :homepage => "value for homepage",
        :user => User.make
      )
    ]
  end

  it "should render list of brands" do
    render "/brands/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for homepage", 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

