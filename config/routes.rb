Rails.application.routes.draw do
  root to: 'pages#home'

  get 'pages/home', as: :home
  get 'pages/result', as: :result
end
