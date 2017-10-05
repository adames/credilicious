class StaticController < ApplicationController

  # TODO must split between routes and controller.

  def about
    render 'static/about'
  end

  # get '/about' do
  #   erb :'static/about.html'
  # end

  def careers
    render 'static/careers'
  end

  # get '/careers' do
  #   erb :'static/careers.html'
  # end

  def contact
    render 'static/contact'
  end

  # get '/contact' do
  #   erb :'static/contact.html'
  # end

end
