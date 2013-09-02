class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_administrator, :require_administrator

  private

  def current_administrator_session
    return @current_administrator_session if defined?(@current_administrator_session)
    @current_administrator_session = AdministratorSession.find
  end

  def current_administrator
    return @current_administrator if defined?(@current_administrator)
    @current_administrator = current_administrator_session && current_administrator_session.record
  end

  def require_administrator
    unless current_administrator.present?
      redirect_to root_path, notice: 'Du skal være logget ind for at se denne side'
    end
  end
end
