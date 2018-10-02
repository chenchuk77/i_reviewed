Rails.application.routes.draw do
  
  # nested notes inside books
  # path to notes will contain also path to books !
  resources :books do
    resources :notes
  end


  root to: "books#index"
end
