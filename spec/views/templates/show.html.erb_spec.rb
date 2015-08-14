require 'rails_helper'

RSpec.describe "templates/show", type: :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      :title => "Title",
      :subject => "Subject",
      :message => "Message",
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/Message/)
    expect(rendered).to match(/File/)
  end
end
