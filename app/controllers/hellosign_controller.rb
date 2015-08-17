class HellosignController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:callbacks]
before_action :set_signature_request, except: [:callbacks, :edit]

  def callbacks
    respond_to do |format|
      format.json { render json: 'Hello API Event Received', status: 200 }
    end
  end

  def new
  end

  def show
    @signature_request.send_request(params[:template_id])
  end

  def edit
    @template = Template.find(params[:id])
    @template.edit_embedded_template
  end

  private

  def set_signature_request
    @signature_request = SignatureRequest.find(params[:id])
  end

end