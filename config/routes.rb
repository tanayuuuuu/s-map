Rails.application.routes.draw do
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
    resources :categories, except: [:new, :show, :destroy]
    resources :users, except: [:new, :create, :destroy]
  end


  root "homes#top"
  get "/homes/about" =>"homes#about"
  get "/map_request_path", to: "application#map", as: "map_request"
  resources :users, except: [:new, :destroy] do
    resources :posts do
      resources :comments, except: [:show]
    end
  end
  resources :categories, only: [:index]
  resources :post_categories

end
