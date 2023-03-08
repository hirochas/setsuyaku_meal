Rails.application.routes.draw do


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用devise
  # URL /users/sign_in ...
  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

  # testアカウント
  devise_scope :customer do
    post 'customer/guest_sign_in', to: 'customer/sessions#guest_sign_in'
  end

  # 管理者用devise
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # 顧客用
  scope module: :customer do
    root to: 'homes#top'  #topページ

    get "about" => "homes#about", as: "about"


    get 'customers/unsubscribe'
    resources :customers, only: [:show, :edit]

  end

  # 管理者用
  namespace :admin do
    resources :genres, only: [:new, :create, :edit, :index, :update]
    resources :customers, only: [:show, :edit, :index, :update]



  end





end

