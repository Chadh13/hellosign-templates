class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  # GET /templates
  # GET /templates.json
  def index
    @templates = current_user.templates
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    @template = current_user.templates.new
  end

  # GET /templates/1/edit
  def edit
    @template.edit_embedded_template
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = current_user.templates.new(template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to [current_user, @template], notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to [current_user, @template], notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to user_templates_path(current_user), notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:title, :subject, :message, :file, :edit_url, :embedded_draft, :hellosign_id)
    end

end
