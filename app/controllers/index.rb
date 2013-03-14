get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  # Ryan:  REFACTOR PLEASE!!!!!
  # Gavin: Whatever! I think it's perfect.
  # Ryan:  You think WRONG!
  # Gavin: Oh yeah? Why I outta... 
  # [fighting sounds]
  # Gavin: (out of breath) FINE! We'll refactor it!
  # Ryan:  You're damn right we will!
  # -fin-

  content_type :json

  if params[:url] =~ /^http:\/\//
    url = params[:url]
  else 
    url =  'http://' + params[:url]
  end

  if Url.find_by_original(url)
    url_obj = Url.find_by_original(url)
  else
    url_obj = Url.create(original: url)
  end
  # new_url.original.to_s
  { url: url_obj.original, shortened: url_obj.shortened }.to_json
end

get '/:shorty' do
  #PLEASE fefactor me!!!! ahhhhhhh

  @url = Url.find_by_shortened(params[:shorty])
  @url.visits += 1
  @url.save

  redirect @url.original
end
