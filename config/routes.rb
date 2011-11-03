SecureWiki::Application.routes.draw do
  resources :pages, :only => [:index, :new, :create]
  # root :to => "home#index"

  devise_for :users
  resources :users, :only => [:index, :show]

  root :to => "pages#show", id: 'home'

  match ':id(.:format)/new' => "pages#new", as: :new, via: :get
  match ':id(.:format)/edit' => "pages#edit", as: :edit_page, via: :get
  match ':id(.:format)' => "pages#show", as: :page, via: :get
  match ':id(.:format)' => "pages#update", via: :put
  match ':id(.:format)' => "pages#create", via: :post
  match ':id(.:format)' => "pages#destroy", via: :delete

end
