Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get '/leaderboard' => 'leaderboard_entries#index'
  post'/leaderboard' => 'leaderboard_entries#create'
  get '/leaderboard/:id' => 'leaderboard_entries#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
