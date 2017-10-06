class BorrowersController < ApplicationController

  def index
    @borrowers = Borrower.all
  end

  def new
    @borrower = Borrower.new
  end

  def create
    @borrower = Borrower.create(borrower_params)
    @borrower.card = Card.default_card
    if @borrower.errors.any?
      render 'borrowers/new'
    else
      redirect_to borrower_path(@borrower)
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
    @borrower.update(borrower_params)
    redirect_to borrower_path(@borrower)
  end

  def delete
    Borrower.find(params[:id]).destroy
    redirect_to '/'
  end

  private

    def borrower_params
      params.require(:borrower).permit(:first_name, :last_name, :phone_number,
                                        :email, :address)
    end

end
