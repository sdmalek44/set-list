class SetList < Sinatra::Base

  get '/songs' do
    erb :"songs/index"
  end

end
