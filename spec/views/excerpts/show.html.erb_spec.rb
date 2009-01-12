require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/excerpts/show.html.erb" do
  include ExcerptsHelper
  
  before(:each) do
    assigns[:excerpt] = @excerpt = stub_model(Excerpt,
      :context_type => "value for context_type",
      :description => "value for description",
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/excerpts/show.html.erb"
    response.should have_text(/value\ for\ context_type/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(//)
  end
end

