Rails.application.routes.draw do
  root to: 'trees#index'
  resources :trees, only: [:index] do
    collection do
      get :search
    end
  end
end
