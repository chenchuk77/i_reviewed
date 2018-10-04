Rails.application.routes.draw do
  
  # nested notes inside books
  # path to notes will contain also path to books !
  resources :books do
    # no need for all 7 actions for a note
    resources :notes, only: [:create, :destroy]
  end

  # sessions are resources, but treated as login/logout
  resources :sessions, only: [:new, :create, :destroy]

  get    "/login"  => "sessions#new",     as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"

  root to: "books#index"
end
