DoMe::Application.routes.draw do
  devise_for :users
  root to: 'activities#home'
  get 'activities/about', to: 'activities#about'
  resources :activities
  post 'adventures/new', to: 'adventures#new' # saves adventure to database, then redirects
  get 'adventures/new/:id', to: 'adventures#new_after_login'
  get 'adventures/activity/:id', to: 'adventures#update', as: 'adventure_stories' # empty form for story
  post 'adventures/activity/:id', to: 'adventures#create_story', as: 'adventure_new_story' # submit form for story (ajaxy)
  get 'adventures', to: 'adventures#index', as: 'user_adventures'
end
