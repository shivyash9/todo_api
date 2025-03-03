Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :create, :destroy, :update] do
        member do
          patch :mark_completed
          patch :update_status
        end
      end
    end
  end
end
