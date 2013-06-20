Buddyup::Application.routes.draw do
  root :to => "people#index"
  resources :people, :only => [:new, :create, :destroy, :show]
  resources :teams, :only => [:index, :new, :create, :destroy] do
    resources :team_assignment, :only => [:new, :create, :destroy]
  end
end
