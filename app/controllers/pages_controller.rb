require 'net/https'
require 'uri'
require 'json'

class PagesController < ApplicationController
  include PagesHelper
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def browse
    @current_browse_page = params[:page] || '1'
    p = { :type => 'TOP_250_BEST_FILMS', :page => @current_browse_page}
    @movies = movies_from_params(p)
  end

  def find
    uri = URI("https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.path + params[:title], {'Content-Type' => 'application/json', "X-API-KEY"=> "8c8e1a50-6322-4135-8875-5d40a5420d86"})
    response = http.request(request)
    @movies = JSON.parse(response.body)
  end

end
