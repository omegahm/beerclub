class MetaController < ApplicationController
  before_filter :require_administrator
  before_action :set_metum, only: [:edit, :update, :destroy]

  # GET /meta
  # GET /meta.json
  def index
    @meta = Metum.order(:created_at)
  end

  # GET /meta/new
  def new
    @metum = Metum.new
  end

  # GET /meta/1/edit
  def edit
  end

  # POST /meta
  # POST /meta.json
  def create
    @metum = Metum.new(metum_params)

    respond_to do |format|
      if @metum.save
        format.html { redirect_to meta_path, notice: 'Metadata blev oprettet.' }
        format.json { render action: 'show', status: :created, location: @metum }
      else
        format.html { render action: 'new' }
        format.json { render json: @metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meta/1
  # PATCH/PUT /meta/1.json
  def update
    respond_to do |format|
      if @metum.update(metum_params)
        format.html { redirect_to meta_path, notice: 'Metadata blev opdateret.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meta/1
  # DELETE /meta/1.json
  def destroy
    @metum.destroy
    respond_to do |format|
      format.html { redirect_to meta_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metum
      @metum = Metum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metum_params
      params.require(:metum).permit(:cash, :loss, :stock)
    end
end
