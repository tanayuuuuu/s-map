Rails.application.routes.draw do
  namespace :admin do
    get 'comments/index'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
  end
  namespace :admin do
    get 'categories/index'
    get 'categories/create'
    get 'categories/edit'
    get 'categories/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  get 'comments/new'
  get 'comments/index'
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/show'
  get 'posts/destroy'
  get 'posts/update'
  get 'categories/index'
  get 'users/show'
  get 'users/quit'
  get 'users/out'
  get 'users/edit'
  get 'users/update'
  get 'homes/top'
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}

  devise_for :admins, controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


    end
