class BorrowersController < AppController

  get '/borrowers' do
    erb :index
  end

  get '/borrowers/new' do
    erb :new
  end

  post '/borrowers' do
    @borrower = Borrower.create(parmas[:borrower])
    redirect "/borrowers/#{@borrower.id}"
  end

  get '/borrowers/:id' do
    @borrower = Borrower.find(params[:id])
    erb :show
  end

  get '/borrowers/:id/edit' do
    @borrower = Borrower.find(params[:id])
    erb :edit
  end

  patch 'borrowers/:id' do
    Borrower.find(params[:id]).update(params[:borrower])
    redirect '/borrowers/:id'
  end

  delete 'borrowers/:id' do
    Borrower.find(params[:id]).destroy
    redirect '/'
  end


end
