class ApplicationController < ActionController::Base
  before_action :session_cheque
  helper_method :current_page, :per_page, :display_cheque?

  def session_cheque
    return if params[:cheque].blank?
    if params[:cheque] == "false"
      session[:cheque] = false
    else
      session[:cheque] = nil
    end
  end

  def current_page
    @page ||= (params[:page].blank? || params[:page].to_i < 1) ? 1 : params[:page].to_i
  end

  def per_page
    @per_page ||= (params[:per_page].blank? || params[:per_page].to_i < 1) ? 30 : params[:page].to_i
  end

  def display_cheque?
    session[:cheque].nil?
  end

end
