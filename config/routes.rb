Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#home'

  get 'contact', to: 'static#contact'
  get 'careers', to: 'static#careers'
  get 'about', to: 'static#about'

  resources :borrowers

end
