class ContentsController < ApplicationController
  def show
    uri = URI("https://kinopoiskapiunofficial.tech/api/v2.2/films/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.path + params[:id], {'Content-Type' => 'application/json', "X-API-KEY"=> "8c8e1a50-6322-4135-8875-5d40a5420d86"})
    response = http.request(request)
    @content = JSON.parse(response.body)
  end

end
