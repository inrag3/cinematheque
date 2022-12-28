module PagesHelper
  URL = "https://kinopoiskapiunofficial.tech/api/v2.2/films"
  def full_title(page_title = '')
    base_title = "Cinematheque"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def top
    params[:page] ||= '1'
    @current_browse_page = params[:page]
    uri = URI(URL + "/top?")
    api_request(uri)
  end

  def movies
    params[:page] ||= '1'
    @current_browse_page = params[:page]
    uri = URI(URL + "/search-by-keyword?")
    api_request(uri)
  end

  def id
    uri = URI(URL + "/#{params[:id]}")
    params[:id] = nil
    api_request(uri)
  end

  def get_type_from_rate(vote)
    if vote.to_f >= 7
      return "green"
    elsif vote.to_f > 5
      return "orange"
    end
    "red"
  end

  private
  def api_request(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    p = { type: params[:type], id: params[:id], keyword: params[:search], page: params[:page] }
    p.delete_if{|_,v| v.nil? }
    pp uri.to_s + p.map{|k,v| "#{k}=#{CGI.escape(v)}"}.join("&")
    request = Net::HTTP::Get.new(uri.to_s + p.map{|k,v| "#{k}=#{CGI.escape(v)}"}.join("&"), {'Content-Type' => 'application/json', "X-API-KEY"=> "8c8e1a50-6322-4135-8875-5d40a5420d86"})
    response = http.request(request)
    JSON.parse(response.body)
  end

end