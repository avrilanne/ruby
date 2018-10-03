
Rails.application.routes.draw do
  root to: "loans#index", only: [:index, :new, :create]
  resources :loans, only: [:index, :show], defaults: {format: :json}

  resources :loans do
    resources :payments, only: [:index, :new, :create, :show]
  end
end
