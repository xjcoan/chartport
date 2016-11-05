class PagesController < ApplicationController

  def index
    @page_title = "Home"
    if current_user
      redirect_to dashboard_path
    end
  end

  def about
    @page_title = "About"
    if current_user
      redirect_to dashboard_path
    end
  end

end
