Rails.application.routes.draw do

  post 'reservations/:reservation_id/payment/new' => 'payment#checkout'

  post 'listings/search' => 'listings#search'

  post 'listings/autocomplete' => 'listings#autocomplete'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :listings do 
    resources :reservations, only: [:new, :create, :index]
  end
  resources :welcome
  resources :reservations do
   resources :payment, only: [:new]
 end


  resources :users, controller: "users", only: [:create, :index, :edit, :update] do
    resources :reservations, controller: "reservations", only: [:index, :show]
    resources :listings, controller: "listings", only: [:index, :show]
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "welcome#index", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'


  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
