require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/instruments/edit.html.erb" do
  include InstrumentsHelper
  
  before(:each) do
    assigns[:instrument] = @instrument = stub_model(Instrument,
      :new_record? => false,
      :name => "value for name",
      :brand => Brand.make,
      :user => User.make
    )
  end

  it "should render edit form" do
    render "/instruments/edit.html.erb"
    
    response.should have_tag("form[action=#{instrument_path(@instrument)}][method=post]") do
      with_tag('input#instrument_name[name=?]', "instrument[name]")
      with_tag('input#instrument_belongs_to[name=?]', "instrument[belongs_to]")
      with_tag('input#instrument_belongs_to[name=?]', "instrument[belongs_to]")
    end
  end
end


