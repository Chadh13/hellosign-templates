require 'rails_helper'

RSpec.describe "signature_requests/new", type: :view do
  before(:each) do
    assign(:signature_request, SignatureRequest.new(
      :template => nil,
      :email => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new signature_request form" do
    render

    assert_select "form[action=?][method=?]", signature_requests_path, "post" do

      assert_select "input#signature_request_template_id[name=?]", "signature_request[template_id]"

      assert_select "input#signature_request_email[name=?]", "signature_request[email]"

      assert_select "input#signature_request_name[name=?]", "signature_request[name]"
    end
  end
end
