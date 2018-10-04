Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # nested notes inside books
  # path to notes will contain also path to books !
  resources :books do
    # no need for all 7 actions for a note
    resources :notes, only: [:create, :destroy]
  end


  root to: "books#index"
end
