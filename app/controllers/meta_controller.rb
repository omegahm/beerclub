class MetaController < ApplicationController
  before_filter :require_administrator
  before_action :set_metum, only: [:edit, :update, :destroy]

  # GET /meta
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
  def create
    @metum = Metum.new(metum_params)

    if @metum.save
      redirect_to meta_path, notice: 'Metadata blev oprettet.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /meta/1
  def update
    if @metum.update(metum_params)
      redirect_to meta_path, notice: 'Metadata blev opdateret.'
    else
      render action: 'edit'
    end
  end

  # DELETE /meta/1
  def destroy
    @metum.destroy
    redirect_to meta_url
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
