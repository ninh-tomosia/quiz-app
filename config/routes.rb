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
    # concern :paginatable do
    #   get '(page/:page)', action: :index, on: :collection, as: ''
    # end
    root '/guest/home#index'
    resources :home #, concerns: :paginatable
    resources :users
    resources :example
    resources :exam
    # put "example/exam", to: "example#exam/:id"
    resource  :histories
  end

  scope module: 'creator' do
    resources :categories
    resources :tickets
    resources :questions
    resources :subtickets
    resources :history
  end
  resources :charges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
