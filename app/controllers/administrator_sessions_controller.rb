class AdministratorSessionsController < ApplicationController
  # GET /administrator_sessions/new
  def new
    @administrator_session = AdministratorSession.new
  end

  # POST /administrator_sessions
  # POST /administrator_sessions.json
  def create
    @administrator_session = AdministratorSession.new(administrator_session_params)

    respond_to do |format|
      if @administrator_session.save
        format.html { redirect_to administrators_path, notice: 'Du er nu logged ind.' }
        format.json { render action: 'show', status: :created, location: @administrator_session }
      else
        format.html { render action: 'new' }
        format.json { render json: @administrator_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrator_sessions/1
  # DELETE /administrator_sessions/1.json
  def destroy
    @administrator_session = AdministratorSession.find
    @administrator_session.destroy

    respond_to do |format|
      format.html { redirect_to administrators_path, notice: 'På gensyn!' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_session_params
      params.require(:administrator_session).permit(:username, :password)
    end
end
