namespace :madmin do
  resources :users
  root to: "dashboard#show"
end
