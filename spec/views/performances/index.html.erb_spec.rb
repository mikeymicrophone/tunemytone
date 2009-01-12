require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/performances/index.html.erb" do
  include PerformancesHelper
  
  before(:each) do
    assigns[:performances] = [
      stub_model(Performance,
        :song => ,
        :show => ,
        :user => 
      ),
      stub_model(Performance,
        :song => ,
        :show => ,
        :user => 
      )
    ]
  end

  it "should render list of performances" do
    render "/performances/index.html.erb"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", , 2)
  end
end

