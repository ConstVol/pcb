Rails.application.routes.draw do
  resources :logs
  get  '/quiz/new', to: 'quiz#new'
  post '/quiz', to: 'quiz#solve'
  root 'logs#index'
end
