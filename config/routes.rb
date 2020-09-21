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
    get "exam/intro", to: "exam#intro"
    get "exam/check_code", to:  "exam#check_code"
    put "exam/answer", to: "exam#answer"
    post "exam/handle_example", to: "exam#handle_example"
    resources :home #, concerns: :paginatable
    resources :users
    resources :example
    resources :exam
    get "paticipant/history", to: "history#index"
  end

  scope module: 'creator' do
    resources :categories
    resources :tickets
    # resources :questions
    get "creator/question/change", to: "questions#new"
    post "creator/question", to: "questions#create"
    delete "creator/question", to: "questions#destroy"
    resources :subtickets
    # resources :history
    get "creator/history", to: "history#index"
    get "creator/download", to: "subtickets#download", format: "docx"
    get "creator/download-answer", to: "subtickets#download_answer", format: "docx"
  end
  resources :charges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
