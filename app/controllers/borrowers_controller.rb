class BorrowersController < ApplicationController

  def index
    @borrowers = Borrower.all
  end

  def new
    @borrower = Borrower.new
  end

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

  def show
    redirect_to '/' if !Borrower.exists?(params[:id])
    @borrower = Borrower.find(params[:id])
  end

  def edit
    @borrower = Borrower.find(params[:id])
  end

  def update
    @borrower = Borrower.find(params[:id])
    @borrower.update(params[:borrower])
    redirect_to "/borrowers/#{@borrower.id}"
  end

  def delete
    Borrower.find(params[:id]).destroy
    redirect_to '/'
  end

end
