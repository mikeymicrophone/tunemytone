require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/performances/new.html.erb" do
  include PerformancesHelper
  
  before(:each) do
    assigns[:performance] = stub_model(Performance,
      :new_record? => true,
      :song => Song.make,
      :show => Show.make,
      :user => User.make
    )
  end

  it "should render new form" do
    render "/performances/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", performances_path) do
      with_tag("input#performance_song[name=?]", "performance[song]")
      with_tag("input#performance_show[name=?]", "performance[show]")
      with_tag("input#performance_user[name=?]", "performance[user]")
    end
  end
end


