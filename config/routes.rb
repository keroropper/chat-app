Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit,:update]
  resources :rooms, only: [:new, :create] do  #ネストすることによって、メッセージを投稿する際、どのルームで投稿されたメッセージなのかをパスから判断できる
    resources :messages, only: [:index, :create]
    #roomsが親で、messagesが子という親子関係になるので、チャットルームに属しているメッセージという意味になる
  end
end

