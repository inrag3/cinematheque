module PagesHelper
  def full_title(page_title = '')
    base_title = "Cinematheque"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end


  def movies_from_params(params)
    uri = URI("https://kinopoiskapiunofficial.tech/api/v2.2/films/top")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.path + '?' + params.map{|k,v| "#{k}=#{v}"}.join("&"), {'Content-Type' => 'application/json', "X-API-KEY"=> "8c8e1a50-6322-4135-8875-5d40a5420d86"})
    response = http.request(request)
    JSON.parse(response.body)
  end

  def get_type_from_rate(vote)
    if vote.to_f >= 7
      return "green"
    elsif vote.to_f > 5
      return "orange"
    end
    "red"
  end

end