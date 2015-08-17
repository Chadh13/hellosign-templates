class SignatureRequest < ActiveRecord::Base
  belongs_to :template

  def send_request(template_id)
    @template = Template.find(template_id)

    client = HelloSign::Client.new :api_key => ENV['HELLOSIGN_API_KEY']
      request = client.create_embedded_unclaimed_draft_with_template(
        :test_mode => 1,
        :client_id => ENV['HELLOSIGN_CLIENT_ID'],
        :template_id => '51d61b1c0b9a7a73b04e245587aa7a59875bd6d7',
        :requester_email_address => email,
        :signing_redirect_url => 'https://hellosign-templates-example.herokuapp.com',
        :requesting_redirect_url => 'https://hellosign-templates-example.herokuapp.com',
        :is_for_embedded_signing => 1,
        :metadata => {
            :House => 'Griffyndor'
        },
        :signers => [
            {
              :email_address => email,
              :name => name,
              :role => 'Test Role'
            },
            {
              :email_address => 'Chad@velocis.us',
              :name => 'Chad H',
              :role => 'Test Role 2'
            }
        ],
        :ccs => [
          {
            :email_address => 'chadheinen13@yahoo.com',
            :role => '0est CC Role'
          }
        ]
    )

    self.claim_url = request.data['claim_url']
    self.signing_redirect = request.data['signing_redirect_url']
    self.hellosign_signature_id = request.data['signature_request_id']
  end

end
