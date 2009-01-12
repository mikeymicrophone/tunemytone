require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/performances/edit.html.erb" do
  include PerformancesHelper
  
  before(:each) do
    assigns[:performance] = @performance = stub_model(Performance,
      :new_record? => false,
      :song => ,
      :show => ,
      :user => 
    )
  end

  it "should render edit form" do
    render "/performances/edit.html.erb"
    
    response.should have_tag("form[action=#{performance_path(@performance)}][method=post]") do
      with_tag('input#performance_song[name=?]', "performance[song]")
      with_tag('input#performance_show[name=?]', "performance[show]")
      with_tag('input#performance_user[name=?]', "performance[user]")
    end
  end
end


