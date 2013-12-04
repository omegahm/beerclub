class AdministratorsController < ApplicationController
  before_filter :require_administrator
  before_action :set_administrator, only: [:edit, :update, :destroy]

  # GET /administrators
  def index
    @administrators = Administrator.all
  end

  # GET /administrators/new
  def new
    @administrator = Administrator.new
  end

  # GET /administrators/1/edit
  def edit
  end

  # POST /administrators
  def create
    @administrator = Administrator.new(administrator_params)

    if @administrator.save
      redirect_to administrators_path, notice: 'Administratoren blev oprettet.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrators/1
  def update
    if @administrator.update(administrator_params)
      redirect_to administrators_path, notice: 'Administratoren blev opdateret.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrators/1
  def destroy
    @administrator.destroy
    redirect_to administrators_url
  end

  def error
    fail 'Error'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
      params.require(:administrator).permit(:username, :email, :password, :password_confirmation)
    end
end
