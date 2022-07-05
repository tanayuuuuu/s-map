Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 devise_for :admins, controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root "homes#top"
    resources :comments, only: [:index]
    resources :posts, only: [:index, :show]
    resources :categories, except: [:new, :show, :destroy]
    resources :users, except: [:new, :create, :destroy]
  end

   devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}
  root "homes#top"
  resources :users, except: [:new, :destroy] do
    resources :posts, except: [:index] do
      resources :comments, except: [:show]
    end
  end
  resources :categories, only: [:index]
  resources :post_categories

end
