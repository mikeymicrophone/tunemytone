require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/instruments/new.html.erb" do
  include InstrumentsHelper
  
  before(:each) do
    assigns[:instrument] = stub_model(Instrument,
      :new_record? => true,
      :name => "value for name",
      :brand => Brand.make,
      :user => User.make
    )
  end

  it "should render new form" do
    render "/instruments/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", instruments_path) do
      with_tag("input#instrument_name[name=?]", "instrument[name]")
      with_tag("input#instrument_belongs_to[name=?]", "instrument[belongs_to]")
      with_tag("input#instrument_belongs_to[name=?]", "instrument[belongs_to]")
    end
  end
end


