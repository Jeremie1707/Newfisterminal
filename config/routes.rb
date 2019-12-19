Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dashboard, only: [:index]
  resources :load_ins, only: [:create]
  patch '/set_page/:page', to: 'dashboard#set_page', as: 'set_page'
  post '/set_rows/', to: 'dashboard#set_rows', as: 'set_rows'
  post '/search/', to: 'dashboard#search', as: 'search'
  post '/set_sort/', to: 'dashboard#set_sort', as: 'set_sort'

end
