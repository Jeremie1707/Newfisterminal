Rails.application.routes.draw do
  devise_for :users #ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'dashboard/index'
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Load In
  resources :dashboard, only: [:index]
  resources :load_ins, only: [:new,:show, :create, :edit, :update, :destroy]
  resources :in_assignments, only: [:new, :create, :update, :destroy]
  post '/scope_search_load_in/', to: 'dashboard#scope_search_load_in', as: 'scope_search_load_in'
  post '/search_load_in/', to: 'dashboard#search_load_in', as: 'search_load_in'
  post '/set_modal_load_in/:load_in', to: 'dashboard#set_modal_load_in', as: 'set_modal_load_in'
  post '/edit_modal_in_assignment/:id', to: 'dashboard#edit_modal_in_assignment', as: 'edit_modal_in_assignment'
  post '/create_modal_in_assignment/:load_in', to: 'dashboard#create_modal_in_assignment', as: 'create_modal_in_assignment'

  #Load Out
  resources :load_outs, only: [:new,:show, :create, :edit, :update, :destroy]
  resources :out_assignments, only: [:new, :create, :update, :destroy]
  post '/scope_search_load_out/', to: 'dashboard#scope_search_load_out', as: 'scope_search_load_out'
  post '/search_load_out/', to: 'dashboard#search_load_out', as: 'search_load_out'
  post '/set_modal_load_out/:load_out', to: 'dashboard#set_modal_load_out', as: 'set_modal_load_out'
  post '/edit_modal_out_assignment/:id', to: 'dashboard#edit_modal_out_assignment', as: 'edit_modal_out_assignment'
  post '/create_modal_out_assignment/:load_out', to: 'dashboard#create_modal_out_assignment', as: 'create_modal_out_assignment'
end

