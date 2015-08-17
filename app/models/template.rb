class Template < ActiveRecord::Base
  belongs_to :user
  has_many :signature_requests

  mount_uploader :file, PdfUploader

  def create_embedded_template
    client = HelloSign::Client.new :api_key => ENV['HELLOSIGN_API_KEY']
      request = client.create_embedded_template_draft(
        :test_mode => 1,
        :client_id => ENV['HELLOSIGN_CLIENT_ID'],
        :files => ['public/api-design-ebook.pdf'],
        :title => title,
        :subject => subject,
        :message => message,
        :signer_roles => [
      {
        :name => 'Test Role',
        :order => 1
      },
      {
        :name => 'Test Role 2',
        :order => 1
      }
      ],
        :cc_roles => ['Test CC Role'],
        :merge_fields => '[{"name":"Test Merge","type":"text"},{"name":"Test Merge 2","type":"text"}]'
      )

    self.hellosign_id = request.data['template_id']
    self.edit_url = request.data['edit_url']
    self.embedded_draft = request.data['is_embedded_draft']
  end

  def edit_embedded_template
    client = HelloSign::Client.new :api_key => ENV['HELLOSIGN_API_KEY']
    response = client.get_embedded_template_edit_url :template_id => hellosign_id
    self.edit_url = response.data
  end
end