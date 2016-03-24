SockChat::Application.routes.draw do
  resources :articles
  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :messages
  root to: 'messages#index'
end
