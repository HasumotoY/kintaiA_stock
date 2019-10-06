Rails.application.routes.draw do
  root "home#top"
  
  #ログイン機能
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  #勤務中社員一覧
  get 'working_users', to:'users#working_users' 
  
  
  #拠点一覧
  get '/bases', to:'bases#index'
  get '/bases', to: 'bases#new'
  post '/bases', to:'bases#create'
  get 'edit/:id', to:'bases#edit'
  patch 'update/:id', to: 'bases#update'
  delete 'destroy/:id', to: 'bases#destroy'
  
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
  
  resources :bases

end
