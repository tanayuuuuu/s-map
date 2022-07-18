Rails.application.routes.draw do
  get 'post_comments/create'
  get 'post_comments/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 devise_for :admins, controllers: {
  sessions: "admins/sessions"
}

devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}


   namespace :admin do
    root "homes#top"
    get "/homes/about" =>"homes#about"

    resources :comments, only: [:index]
    resources :posts, only: [:index, :show]
    resources :categories, except: [:show]
    resources :users, except: [:new, :create, :destroy]
  end


  root "homes#top"
  get "/homes/about" =>"homes#about"
  get "/map_request_path", to: "application#map", as: "map_request"
  get 'users/quit' => "users#quit"
  get "posts/search" => "posts#search"
  patch 'users/out' => "users#out"
  resources :users, except: [:new, :destroy] do
    resources :posts do
      resources :comments, only: [:create, :destroy, :index]
    end
  end
  resources :categories, only: [:index, :show]
  resources :post_categories

end
