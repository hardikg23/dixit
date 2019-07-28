class ApplicationController < ActionController::Base

  helper_method :current_page, :per_page

  def current_page
    @page ||= (params[:page].blank? || params[:page].to_i < 1) ? 1 : params[:page].to_i
  end

  def per_page
    @per_page ||= (params[:per_page].blank? || params[:per_page].to_i < 1) ? 30 : params[:page].to_i
  end

end
