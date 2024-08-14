Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :clients, only: [:index, :show, :new, :create]
  resources :client_schedules, only: [:index, :show, :new, :create] do
    collection do
      get :load_schedules
    end
  end
  resources :supporter_employees, only: [:index, :show, :new, :create]
  resources :schedule_assignments, only: [:create]
end
