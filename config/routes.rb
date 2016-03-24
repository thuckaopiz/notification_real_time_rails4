SockChat::Application.routes.draw do
  root to: 'chat#index'
  get '/chat' => 'chat#chat'
  get '/other_chat' => 'chat#other_chat'
  get '/other_index' => 'chat#other_index'
end
