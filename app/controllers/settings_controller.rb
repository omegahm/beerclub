class SettingsController < ApplicationController
  before_action :set_setting, only: [:edit, :update, :destroy]

  # GET /settings
  def index
    @settings = Setting.select(:id, :key, :value)
  end

  # GET /settings/new
  def new
    @setting = Setting.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      redirect_to settings_path, notice: 'Indstillingen blev oprettet.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /settings/1
  def update
    if @setting.update(setting_params)
      redirect_to settings_path, notice: 'Indstillingen blev opdateret.'
    else
      render action: 'edit'
    end
  end

  # DELETE /settings/1
  def destroy
    @setting.destroy
    redirect_to settings_url
  end

  def error
    fail 'Error'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_setting
    @setting = Setting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def setting_params
    params.require(:setting).permit(:key, :value)
  end
end
