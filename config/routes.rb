DoMe::Application.routes.draw do
  devise_for :users
  root to: 'activities#home'
  get 'activities/about', to: 'activities#about'
  resources :activities
  resources :adventures
end
