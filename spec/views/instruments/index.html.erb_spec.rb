require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/instruments/index.html.erb" do
  include InstrumentsHelper
  
  before(:each) do
    assigns[:instruments] = [
      stub_model(Instrument,
        :name => "value for name",
        :brand => Brand.make,
        :user => User.make
      ),
      stub_model(Instrument,
        :name => "value for name",
        :brand => Brand.make,
        :user => User.make
      )
    ]
  end

  it "should render list of instruments" do
    render "/instruments/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", 'guitars', 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

