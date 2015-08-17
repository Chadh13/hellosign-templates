require "rails_helper"

RSpec.describe SignatureRequestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/signature_requests").to route_to("signature_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/signature_requests/new").to route_to("signature_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/signature_requests/1").to route_to("signature_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/signature_requests/1/edit").to route_to("signature_requests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/signature_requests").to route_to("signature_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/signature_requests/1").to route_to("signature_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/signature_requests/1").to route_to("signature_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/signature_requests/1").to route_to("signature_requests#destroy", :id => "1")
    end

  end
end
