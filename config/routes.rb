Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dashboard, only: [:index]
  resources :load_ins, only: [:new, :create, :edit, :update, :destroy]
  resources :in_assignments, only: [:new, :create, :update, :destroy]
  patch '/set_page/:page', to: 'dashboard#set_page', as: 'set_page'
  post '/set_rows/', to: 'dashboard#set_rows', as: 'set_rows'
  post '/search/', to: 'dashboard#search', as: 'search'
  post '/set_sort/', to: 'dashboard#set_sort', as: 'set_sort'
  post '/set_modal/:load_in', to: 'dashboard#set_modal', as: 'set_modal'
  post '/edit_modal_in_assignment/:id', to: 'dashboard#edit_modal_in_assignment', as: 'edit_modal_in_assignment'
  post '/create_modal_in_assignment/:load_in', to: 'dashboard#create_modal_in_assignment', as: 'create_modal_in_assignment'
end
