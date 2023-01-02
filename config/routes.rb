Rails.application.routes.draw do
  root "top#index"
  resources :loto_sixes, only: :index
  resources :loto_sevens, only: [:index] do
    collection do
      get :frequencies
      get :predictions
    end
  end
end
