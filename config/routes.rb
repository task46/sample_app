Rails.application.routes.draw do

  # get 'password_resets/new'

  # get 'password_resets/edit'

  # get 'sessions/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup' , to: 'users#new'
  # post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  # get "/users" => "users#index"          #ユーザー一覧画面を生成
  # get "/users/:id" => "users#show"       #個別ユーザー詳細画面を生成
  # get "/users/new" => "users#new"        #新規ユーザー登録画面を生成
  # post "/users" => "users#create"        #新規ユーザー登録画面からの入力を受けて登録処理
  # get "/users/:id/edit" => "users#edit"  #既存ユーザー編集画面を生成
  # patch "/users/:id" => "users#update"   #編集画面からの入力を受けて更新処理
  # put "/users/:id" => "users#update"     #編集画面からの入力を受けて更新処理
  # delete "/users/:id" => "users#destroy" #一覧画面で選択されたデータを削除処理
  
  resources :account_activations, only:[:edit]
  # get  "/account_activation/<token>/edit" edit  edit_account_activation_url(token)
  
  #検索キー　string    digest              authentication
  #email      password   password_digest    authenticate(password)
  #id       remember_token   remember_digest    authenticated?(:remember, token)
  #email      activation_token   activation_digest    authenticated?(:activation, token)
  #email      reset_token   reset_digest    authenticate(:reset, token)
  
  
  
  resources :password_resets,  only:[:new, :create, :edit, :update]
  # get  "/password_resets/new"  new    new_password_reset_path
  # post  "/password_resets"  creates    password_resets_path
  # get  "/password_resets/<token>/edit"  edit    edit_password_reset_url(token)
  # patch  "/password_resets/new"  update   password_reset_url(token)
  
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]  
end
