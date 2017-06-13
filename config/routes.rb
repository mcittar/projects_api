Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :createproject, only: [:create], controller: 'projects'
  get "requestproject" => "projects#show"
  root to: "projects#index"
end
