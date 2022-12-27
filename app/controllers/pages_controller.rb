require 'net/https'
require 'uri'
require 'json'

class PagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def browse
    uri = URI("https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=1")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json', "X-API-KEY"=> "8c8e1a50-6322-4135-8875-5d40a5420d86"})
    response = http.request(request)
    @movies = JSON.parse(response.body)
  end

  def about

  end
end
