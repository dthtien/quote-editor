Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  resources :quotes do
    resources :line_item_dates, except: %i[index show] do
      resources :line_items, except: %i[index show]
    end
  end
end
