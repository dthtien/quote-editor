Rails.application.routes.draw do
  root to: "pages#home"
  # devise_for :users

  namespace :api do
    devise_for(
      :users,
      path: "",
      path_names: {
        sign_in: "login",
        sign_out: "logout"
      },
      controllers: {
        sessions: "api/users/sessions"
      },
      singular: :user
    )

    namespace :users do
      resource :detail, only: %i[show destroy update]
    end
  end

  get "up" => "rails/health#show", :as => :rails_health_check

  resources :quotes do
    resources :line_item_dates, except: %i[index show] do
      resources :line_items, except: %i[index show]
    end
  end
end
