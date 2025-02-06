Rails.application.routes.draw do
  devise_for :users
  resources :habits, only: [:index, :new, :create]

  authenticate :user do
    resources :users, only: [:show, :index] # 必要なら他のアクションも追加
  end
  root "habits#index"
end
