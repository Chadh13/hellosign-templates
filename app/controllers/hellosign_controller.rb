class HellosignController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:callbacks]

  def callbacks
    respond_to do |format|
      format.json { render json: 'Hello API Event Received', status: 200 }
    end
  end

  def new
    @signature_request = SignatureRequest.find(params[:format])
    @signature_request.send_request
  end

  def show

  end

  def edit
    @template.edit_embedded_template
  end

  private

  def set_template_id
    @template = Template.find(params[:template_id])
  end

end