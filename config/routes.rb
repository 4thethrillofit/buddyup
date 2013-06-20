Buddyup::Application.routes.draw do
  root :to => "teams#index"
  resources :people, :except => [:edit, :update, :show]
  resources :teams, :except => [:edit, :update] do
    # resources :team_assignment, :only => [:new, :create, :destroy]
  end
end
