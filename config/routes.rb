Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  as :user do
    get     "signin" => "devise/sessions#new"
    post    "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end

  scope module: 'guest' do
    root '/guest/home#index'
    resources :home
    resources :users
  end

  scope module: 'creator' do
    resources :categories
    resources :tickets
    resources :questions
    resources :subtickets
    get '/subtickets/download', to: "subtickets#download"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
