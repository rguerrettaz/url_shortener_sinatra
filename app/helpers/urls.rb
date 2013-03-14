helpers do
  def ensure_protocol(url)
    unless url =~ /^https?:\/\//
      url = 'http://' + url
    end
    url
  end
end
