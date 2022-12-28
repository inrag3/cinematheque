class ContentsController < ApplicationController
  include PagesHelper
  def show
    @content = id
  end
end
