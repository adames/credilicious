class StaticController < ApplicationController

  def about
    render 'static/about'
  end

  def careers
    render 'static/careers'
  end

  def contact
    render 'static/contact'
  end

end
