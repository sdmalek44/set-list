class SetList < Sinatra::Base

  get '/' do
    erb :'songs/welcome'
  end

  get '/songs' do
    songs = Song.all.includes(:playlist) #scans all song table data and finds playlists for songs that have a playlist
    erb :'songs/index', locals: {songs: songs}
  end


  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end


  post '/songs' do
    Song.create(params[:song])
    redirect '/songs'
  end
end
