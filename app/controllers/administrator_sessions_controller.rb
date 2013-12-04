class AdministratorSessionsController < ApplicationController
  # GET /administrator_sessions/new
  def new
    @administrator_session = AdministratorSession.new
  end

  # POST /administrator_sessions
  def create
    @administrator_session = AdministratorSession.new(administrator_session_params)

    if @administrator_session.save
      redirect_to administrators_path, notice: 'Du er nu logget ind.'
    else
      render action: 'new'
    end
  end

  # DELETE /administrator_sessions/1
  def destroy
    @administrator_session = AdministratorSession.find
    @administrator_session.destroy

    redirect_to administrators_path, notice: 'På gensyn!'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_session_params
      params.require(:administrator_session).permit(:username, :password)
    end
end
