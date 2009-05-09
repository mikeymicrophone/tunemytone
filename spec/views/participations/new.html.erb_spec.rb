require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/participations/new.html.erb" do
  include ParticipationsHelper
  
  before(:each) do
    assigns[:participation] = stub_model(Participation,
      :new_record? => true,
      :artist => Artist.make,
      :duration_type => "value for duration_type",
      :user => User.make
    )
  end

  it "should render new form" do
    render "/participations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", participations_path) do
      with_tag("input#participation_artist[name=?]", "participation[artist]")
      with_tag("input#participation_duration_type[name=?]", "participation[duration_type]")
      with_tag("input#participation_user[name=?]", "participation[user]")
    end
  end
end


