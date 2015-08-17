require 'rails_helper'

RSpec.describe "signature_requests/show", type: :view do
  before(:each) do
    @signature_request = assign(:signature_request, SignatureRequest.create!(
      :template => nil,
      :email => "Email",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
  end
end
