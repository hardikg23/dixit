class ApplicationController < ActionController::Base
  before_action :session_cheque
  helper_method :current_page, :per_page, :display_cheque?

  def session_cheque
    return if params[:only_cheque].blank?
    if params[:only_cheque] == "false"
      session[:only_cheque] = false
    else
      session[:only_cheque] = nil
    end
  end

  def current_page
    @page ||= (params[:page].blank? || params[:page].to_i < 1) ? 1 : params[:page].to_i
  end

  def per_page
    @per_page ||= (params[:per_page].blank? || params[:per_page].to_i < 1) ? 30 : params[:page].to_i
  end

  def display_cheque?
    session[:only_cheque].nil?
  end

end
