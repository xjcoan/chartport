class PagesController < ApplicationController

  def index
    @page_title = "Home"
    if current_user
      redirect_to dashboard_path
    end

    respond_to do |format|
      format.html
    end
  end

  def about
    @page_title = "About"
    if current_user
      redirect_to dashboard_path
    end

    respond_to do |format|
      format.html
    end
  end
end
