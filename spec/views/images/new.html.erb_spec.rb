require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/new.html.erb" do
  include ImagesHelper
  
  before(:each) do
    assigns[:image] = stub_model(Image,
      :new_record? => true,
      :name => "value for name",
      :user => 
    )
  end

  it "should render new form" do
    render "/images/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", images_path) do
      with_tag("input#image_name[name=?]", "image[name]")
      with_tag("input#image_user[name=?]", "image[user]")
    end
  end
end


