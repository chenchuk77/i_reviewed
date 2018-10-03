Rails.application.routes.draw do
  
  # nested notes inside books
  # path to notes will contain also path to books !
  resources :books do
    # no need for all 7 actions for a note
    resources :notes, only: [:create, :destroy]
  end


  root to: "books#index"
end
