Rails.application.routes.draw do
  get 'pages/home', as: :home
  get 'pages/result', as: :result
end
