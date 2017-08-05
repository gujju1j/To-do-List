class HomeController < ApplicationController
  def show
  end

  def switch_view
    session[:view_style] = params[:view_style]
    redirect_back fallback_location: root_path
  end
end
