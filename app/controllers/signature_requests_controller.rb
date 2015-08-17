class SignatureRequestsController < ApplicationController
  before_action :set_signature_request, only: [:show, :edit, :update, :destroy]
  before_action :set_template

  # GET /signature_requests
  # GET /signature_requests.json
  def index
    @signature_requests = SignatureRequest.all
  end

  # GET /signature_requests/1
  # GET /signature_requests/1.json
  def show
  end

  # GET /signature_requests/new
  def new
    @signature_request = SignatureRequest.new
  end

  # GET /signature_requests/1/edit
  def edit
  end

  # POST /signature_requests
  # POST /signature_requests.json
  def create
    @signature_request = SignatureRequest.new(signature_request_params)
    respond_to do |format|
      if @signature_request.save
        format.html { redirect_to template_signature_requests_path, notice: 'Signature request was successfully created.' }
        format.json { render :show, status: :created, location: @signature_request }
      else
        format.html { render :new }
        format.json { render json: @signature_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signature_requests/1
  # PATCH/PUT /signature_requests/1.json
  def update
    respond_to do |format|
      if @signature_request.update(signature_request_params)
        format.html { redirect_to @signature_request, notice: 'Signature request was successfully updated.' }
        format.json { render :show, status: :ok, location: @signature_request }
      else
        format.html { render :edit }
        format.json { render json: @signature_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signature_requests/1
  # DELETE /signature_requests/1.json
  def destroy
    @signature_request.destroy
    respond_to do |format|
      format.html { redirect_to template_signature_requests_path, notice: 'Signature request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature_request
      @signature_request = SignatureRequest.find(params[:id])
    end

    def set_template
      @template = Template.find(params[:template_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signature_request_params
      params.require(:signature_request).permit(:template_id, :email, :name, :claim_url,:signing_redirect, :hellosign_signature_id)
    end
end
