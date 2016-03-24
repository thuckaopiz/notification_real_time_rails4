SockChat::Application.routes.draw do
  resources :articles

  devise_for :users, controllers: { sessions: "users/sessions" }
  # root to: 'chat#index'
  resources :messages
  root to: 'messages#index'
  get '/chat' => 'chat#chat'
  get '/other_chat' => 'chat#other_chat'
  get '/sign_out' => 'chat#sign_out'
  get '/sign_in' => 'chat#sign_in'
  get '/other_index' => 'chat#other_index'
  get '/create_article' => 'chat#create_article'
end
