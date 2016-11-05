class PagesController < ApplicationController

  def index
    @page_title = "Home"
  end

  def about
    @page_title = "About"
  end

end
