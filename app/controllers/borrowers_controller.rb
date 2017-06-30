class BorrowersController < AppController

  get '/borrowers' do
    erb :'borrowers/index'
  end

  get '/borrowers/new' do
    erb :'borrowers/new'
  end

  post '/borrowers' do
    @borrower = Borrower.create(params[:borrower])
    @borrower.card = Card.default_card
    redirect "/borrowers/#{@borrower.id}"
  end

  get '/borrowers/:id' do
    @borrower = Borrower.find(params[:id])
    erb :'borrowers/show'
  end

  get '/borrowers/:id/edit' do
    @borrower = Borrower.find(params[:id])
    erb :'borrowers/edit'
  end

  patch '/borrowers/:id' do
    @borrower = Borrower.find(params[:id])
    @borrower.update(params[:borrower])
    redirect "/borrowers/#{@borrower.id}"
  end

  delete '/borrowers/:id' do
    Borrower.find(params[:id]).destroy
    redirect '/'
  end


end
