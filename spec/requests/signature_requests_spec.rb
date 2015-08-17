require 'rails_helper'

RSpec.describe "SignatureRequests", type: :request do
  describe "GET /signature_requests" do
    it "works! (now write some real specs)" do
      get signature_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
