class UrlsController < ApplicationController
  def index
    @url = Url.new
  end   

  def show
  end

  def new
   @url = URL.new
  end
end
