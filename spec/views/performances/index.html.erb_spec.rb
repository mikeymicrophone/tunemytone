require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/performances/index.html.erb" do
  include PerformancesHelper
  
  before(:each) do
    assigns[:performances] = [
      stub_model(Performance,
        :song => Song.make,
        :show => Show.make,
        :user => User.make
      ),
      stub_model(Performance,
        :song => Song.make,
        :show => Show.make,
        :user => User.make
      )
    ]
  end

  it "should render list of performances" do
    render "/performances/index.html.erb"
    response.should have_tag("tr>td", 'beauty', 2)
    response.should have_tag("tr>td", 'funky', 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

