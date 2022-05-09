Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, only: [:new, :create, :index, :edit, :update, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    get '/' => 'homes#top'
  end

  namespace :public do
    get '/' => 'homes#top'
    get 'about' => 'homes#about', as:'about'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :customers, only: [:edit, :update]
    get 'customers/mypage' => 'customers#show'
    get 'customers/confirm' => 'customers#confirm'
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    delete '/cart_items' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    resources :cart_items, only: [:create, :index, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :create, :index, :show]



  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
