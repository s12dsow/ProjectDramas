require "httparty"

module TVDB
  API_KEY = "83D9DB7DA81B26FF"
  BASE_URL = "http://www.thetvdb.com/api/"

  def self.build_drama(series_id)
    xml = get(series_url(series_id))

    parse_drama(xml["Data"]["Series"])
  end

  def self.parse_drama(drama_xml)
    name = drama_xml["SeriesName"]
    summary = drama_xml["Overview"]
    image = "http://www.thetvdb.com/banners/" + (drama_xml["poster"] || drama_xml["banner"]).to_s
    tvdbid = drama_xml["id"]

    drama = Drama.find_or_create_by(tvdbid: tvdbid)
    drama.update_attributes(name: name, summary: summary, image: image)
    drama
  end

  def self.get(url)
    HTTParty.get(url)
  end

  def self.build_authenticated_url(path)
    BASE_URL + API_KEY + path
  end

  def self.series_url(series_id)
    build_authenticated_url("/series/" + series_id.to_s + "/all/en.xml")
  end

  def self.build_url(path)
    BASE_URL + path
  end

  def self.search(query)
    terms = query.split(" ").join("%20")

    xml = get(build_url("/GetSeries.php?seriesname=" + terms))
    result = xml["Data"].nil? ? [] : [xml["Data"]["Series"]]
    result.flatten.map do |drama|
      parse_drama(drama)
    end
  end
end
