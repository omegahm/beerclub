class UsersController < ApplicationController
  before_filter :require_administrator
  before_action :set_user, only: [:edit, :update, :destroy]

  # GET /users
  def index
    if params[:all]
      @users = User.order_by_room
    else
      @users = User.visible.order_by_room
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'Brugeren blev oprettet.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'Brugeren blev opdateret.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :room, :visible)
    end
end
