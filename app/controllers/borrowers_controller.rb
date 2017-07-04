class BorrowersController < AppController

  get '/borrowers' do
    erb :'borrowers/index.html'
  end

  get '/borrowers/new' do
    erb :'borrowers/new.html'
  end

  post '/borrowers' do
    @borrower = Borrower.create(params[:borrower])
    @borrower.card = Card.default_card
    if @borrower.errors.any?
      erb :'borrowers/new.html'
    else
      redirect "/borrowers/#{@borrower.id}"
    end
  end

  get '/borrowers/:id' do
    @borrower = Borrower.find(params[:id])
    erb :'borrowers/show.html'
  end

  get '/borrowers/:id/edit' do
    @borrower = Borrower.find(params[:id])
    erb :'borrowers/edit.html'
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
