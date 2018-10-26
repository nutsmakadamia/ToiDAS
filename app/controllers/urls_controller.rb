class UrlsController < ApplicationController
  def index
    @urls = Url.search(params[:search])
    if @urls.blank?
      Url.create(url: params[:search] )
      @urls = Url.search(params[:search])
    end
    redirect_to url_path(@urls.first.id)
  end   

  def show
    @url = Url.find(params[:id])
  end

  def new
  end
end
