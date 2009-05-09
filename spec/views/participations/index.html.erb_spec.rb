require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/participations/index.html.erb" do
  include ParticipationsHelper
  
  before(:each) do
    assigns[:participations] = [
      stub_model(Participation,
        :artist => Artist.make,
        :duration_type => "value for duration_type",
        :user => User.make
      ),
      stub_model(Participation,
        :artist => Artist.make,
        :duration_type => "value for duration_type",
        :user => User.make
      )
    ]
  end

  it "should render list of participations" do
    render "/participations/index.html.erb"
    response.should have_tag("tr>td", 'prince', 2)
    response.should have_tag("tr>td", "value for duration_type", 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

