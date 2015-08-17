require 'rails_helper'

RSpec.describe "signature_requests/index", type: :view do
  before(:each) do
    assign(:signature_requests, [
      SignatureRequest.create!(
        :template => nil,
        :email => "Email",
        :name => "Name"
      ),
      SignatureRequest.create!(
        :template => nil,
        :email => "Email",
        :name => "Name"
      )
    ])
  end

  it "renders a list of signature_requests" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
