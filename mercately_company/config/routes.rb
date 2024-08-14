Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :v1 do
    resources :items, only: %i[index show create]
    resources :orders, only: %i[index show create destroy]
  end
end
