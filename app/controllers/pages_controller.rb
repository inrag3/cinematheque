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

  def about
  end
end
