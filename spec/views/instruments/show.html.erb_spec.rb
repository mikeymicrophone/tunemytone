require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/instruments/show.html.erb" do
  include InstrumentsHelper
  
  before(:each) do
    assigns[:instrument] = @instrument = stub_model(Instrument,
      :name => "value for name",
      :belongs_to => ,
      :belongs_to => 
    )
  end

  it "should render attributes in <p>" do
    render "/instruments/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
    response.should have_text(//)
  end
end

