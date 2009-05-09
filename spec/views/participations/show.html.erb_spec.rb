require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/participations/show.html.erb" do
  include ParticipationsHelper
  
  before(:each) do
    assigns[:participation] = @participation = stub_model(Participation,
      :artist => Artist.make,
      :duration_type => "value for duration_type",
      :user => User.make
    )
  end

  it "should render attributes in <p>" do
    render "/participations/show.html.erb"
    response.should have_text(//)
    response.should have_text(/value\ for\ duration_type/)
    response.should have_text(//)
  end
end

