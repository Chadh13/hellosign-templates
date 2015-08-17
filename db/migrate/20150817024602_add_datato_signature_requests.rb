class AddDatatoSignatureRequests < ActiveRecord::Migration
  def change
      add_column :signature_requests, :claim_url, :string
      add_column :signature_requests, :signing_redirect, :string
      add_column :signature_requests, :hellosign_signature_id, :string
  end
end