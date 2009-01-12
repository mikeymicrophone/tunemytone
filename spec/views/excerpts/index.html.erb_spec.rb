require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/excerpts/index.html.erb" do
  include ExcerptsHelper
  
  before(:each) do
    assigns[:excerpts] = [
      stub_model(Excerpt,
        :context_type => "value for context_type",
        :description => "value for description",
        :user => 
      ),
      stub_model(Excerpt,
        :context_type => "value for context_type",
        :description => "value for description",
        :user => 
      )
    ]
  end

  it "should render list of excerpts" do
    render "/excerpts/index.html.erb"
    response.should have_tag("tr>td", "value for context_type", 2)
    response.should have_tag("tr>td", "value for description", 2)
    response.should have_tag("tr>td", , 2)
  end
end

