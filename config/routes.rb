Rails.application.routes.draw do


  namespace :customer do
    end
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

    get "customers/information/edit" => "customers#edit"
    patch "customers/information" => "customers#update", as: "update_customer"
    get "customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "customers/withdraw" => "customers#withdraw", as: "withdraw"

    resources :customers, only: [:update, :show, :edit]

    resources :resipes, only: [:index, :show, :new, :edit, :update, :create] do
      resource :likes, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create]
    end

    resources :ranks, only: [:index]

    resources :favorites, only: [:index]

    resources :genres, only: :index

end

  # 管理者用
  namespace :admin do

    resources :genres, only: [:new, :create, :edit, :index, :update]
    resources :customers, only: [:show, :edit, :index, :update]
    root to: 'resipes#index'  #topページ
    resources :resipes, only: [:show, :edit, :update]
    resources :comments, only: [:destroy]


  end

end
