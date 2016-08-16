Rails.application.routes.draw do
  root 'home#index'
  post '/', to: 'home#new'
  post '/documents/:id', to: 'home#download'
  get '/documents/:id', to: 'home#download'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
