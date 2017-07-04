class StaticController < AppController

  get '/about' do
    erb :'static/about.html'
  end

  get '/careers' do
    erb :'static/careers.html'
  end

  get '/contact' do
    erb :'static/contact.html'
  end

end
