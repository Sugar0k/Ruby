Rails.application.routes.draw do
  root 'posts#index'
  get 'about' => 'pages#about', as: 'about'

  resources :posts do
    resources :marks
  end
end
