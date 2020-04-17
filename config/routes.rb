Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]
  
  # scope '/admin', module: 'admin' - this line changed to namespace
  namespace :admin do
    resources :stats, only: [:index]
  end  
  # get '/admin/stats', to: 'stats#index'

  root 'posts#index'
end
