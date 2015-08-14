require 'rails_helper'

RSpec.describe "templates/index", type: :view do
  before(:each) do
    assign(:templates, [
      Template.create!(
        :title => "Title",
        :subject => "Subject",
        :message => "Message",
        :file => "File"
      ),
      Template.create!(
        :title => "Title",
        :subject => "Subject",
        :message => "Message",
        :file => "File"
      )
    ])
  end

  it "renders a list of templates" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
