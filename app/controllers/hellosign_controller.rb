class HellosignController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:callbacks]

  def callbacks
    respond_to do |format|
      format.json { render json: 'Hello API Event Received', status: 200 }
    end
  end

  # New Template
  def new
    @template = Template.find(params[:format])
    @template.create_embedded_template
  end

  # Send Signature Request
  def show
    @signature_request = SignatureRequest.find(params[:id])
    @signature_request.send_request(params[:template_id])
  end

  # Edit Template
  def edit
    @template = Template.find(params[:id])
    @template.edit_embedded_template
  end

  private

end