class UrlsController < ApplicationController
  def index
    @urls = Url.search(params[:search])
    if @urls.blank?
      Url.create(url: params[:search] )
      @urls = Url.search(params[:search])
    end
  end   

  def show
  end

  def new
  end
end
