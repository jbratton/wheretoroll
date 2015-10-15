module URLFormatter
  extend ActiveSupport::Concern

  private
  def format_url_for_db(url)
    unless url[0..6] == 'http://'
      "http://#{url}"
    else
      url
    end
  end
end

