class BorrowersController < ApplicationController

  # TODO must split between routes and controller.

  def index
    @borrower = Borrower.all
  end

  # get '/borrowers' do
  #   erb :'borrowers/index.html'
  # end

  def new
    @borrower = Borrower.new
  end

  # get '/borrowers/new' do
  #   erb :'borrowers/new.html'
  # end

  def create
    #needs strong params integration
    @borrower = Borrower.create(params[:borrower])
    @borrower.card = Card.default_card
    if @borrower.errors.any?
      erb :'borrowers/new.html'
    else
      redirect_to "/borrowers/#{@borrower.id}"
    end
  end

  # post '/borrowers' do
  #   @borrower = Borrower.create(params[:borrower])
  #   @borrower.card = Card.default_card
  #   if @borrower.errors.any?
  #     erb :'borrowers/new.html'
  #   else
  #     redirect_to "/borrowers/#{@borrower.id}"
  #   end
  # end

  def show
    redirect_to '/' if !Borrower.exists?(params[:id])
    @borrower = Borrower.find(params[:id])
  end

  # get '/borrowers/:id' do
  #   redirect_to '/' if !Borrower.exists?(params[:id])
  #   @borrower = Borrower.find(params[:id])
  #   erb :'borrowers/show.html'
  # end

  def edit
    @borrower = Borrower.find(params[:id])
    erb :'borrowers/edit.html'
  end

  # get '/borrowers/:id/edit' do
  #   @borrower = Borrower.find(params[:id])
  #   erb :'borrowers/edit.html'
  # end

  def update
    @borrower = Borrower.find(params[:id])
    @borrower.update(params[:borrower])
    redirect_to "/borrowers/#{@borrower.id}"
  end

  # patch '/borrowers/:id' do
  #   @borrower = Borrower.find(params[:id])
  #   @borrower.update(params[:borrower])
  #   redirect_to "/borrowers/#{@borrower.id}"
  # end

  def delete
    Borrower.find(params[:id]).destroy
    redirect_to '/'
  end

  # delete '/borrowers/:id' do
  #   Borrower.find(params[:id]).destroy
  #   redirect_to '/'
  # end


end
