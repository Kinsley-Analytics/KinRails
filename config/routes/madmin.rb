# Below are the routes for madmin
namespace :madmin do
  resources :users
  namespace :ahoy do
    resources :events
  end
  namespace :ahoy do
    resources :visits
  end
  root to: "dashboard#show"
end
