require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/performances/show.html.erb" do
  include PerformancesHelper
  
  before(:each) do
    assigns[:performance] = @performance = stub_model(Performance,
      :song => Song.make,
      :show => Show.make,
      :user => User.make
    )
  end

  it "should render attributes in <p>" do
    render "/performances/show.html.erb"
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(//)
  end
end

