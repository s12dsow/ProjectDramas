require 'httparty'

module TVDB
  API_KEY  = '83D9DB7DA81B26FF'
  BASE_URL = 'http://www.thetvdb.com/api/'

  def self.build_drama(series_id)
    xml = xml_response(series_id)

    drama = parse_drama(xml, series_id)
  end

  def self.parse_drama(xml, series_id)
    name   = xml['Data']['Series']['SeriesName']
    summary = xml['Data']['Series']['Overview']
    image  = "http://www.thetvdb.com/banners/" + xml['Data']['Series']['poster'].to_s
    tvdbid = xml['Data']['Series']['id']

    drama = Drama.new(name: name, summary: summary, image: image, tvdbid: tvdbid )
    # might not be the best way to go here -- what if use another api?
    # tvdb_id
    drama.id = tvdbid
    drama.save
    return drama
  end

  def self.xml_response(series_id)
    HTTParty.get(build_url(series_id))
  end

  def self.build_url(series_id)
    BASE_URL + API_KEY + '/series/' + series_id.to_s + '/all/en.xml'
  end

end