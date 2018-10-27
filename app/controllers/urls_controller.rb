require 'net/http'

class UrlsController < ApplicationController
  def index
    if url_request(params[:search])
      @urls = Url.search(params[:search])
      if @urls.blank?
        Url.create(url: params[:search] )
        @urls = Url.search(params[:search])
      end
      redirect_to url_path(@urls.first.id)
    else
      redirect_to root_path
    end   
  end  

  def show
    @url = Url.find(params[:id])
  end
  
  def url_request(url, limit = 10)
  if limit == 0
    return false
  end
  begin
    response = Net::HTTP.get_response(URI.parse(url))
  rescue
    return false
  else
    case response
    when Net::HTTPSuccess
      return true
    when Net::HTTPRedirection
      url_request(response['location'], limit - 1)
    else
      return false
    end
  end

end
  
end
