Rails.application.routes.draw do
  root "home#top"
  
  #ログイン機能
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'working_users', to:'users#working_users' 
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
      
    end
    resources :attendances, only: :update
    collection { post :import }
  end

  end
