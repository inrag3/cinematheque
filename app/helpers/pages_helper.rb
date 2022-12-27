module PagesHelper
  def full_title(page_title = '')
    base_title = "Cinematheque"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  def getClassByRate(vote)

    if (vote.to_f >= 7)
      "green"
    elsif (vote.to_f > 5)
      "orange"
    else 
      "red"
    end
  end

end