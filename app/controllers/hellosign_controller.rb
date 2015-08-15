class HellosignController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:callbacks]

  def callbacks
    respond_to do |format|
      format.json { render json: 'Hello API Event Received', status: 200 }
    end
  end

  def show
    @template = Template.find(params[:id])
  end

  def edit
    @template = Template.find(params[:id])
    @template.edit_embedded_template
  end

end