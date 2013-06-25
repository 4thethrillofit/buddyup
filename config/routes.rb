Buddyup::Application.routes.draw do
  root :to => "teams#index"
  resources :people, :except => [:edit, :update, :show]

  resources :teams, :except => [:edit, :update] do
    resources :team_assignments, :only => [:create, :destroy]
    member do
      get 'send_weekly_pairs' => 'teams#send_weekly_pairs'
      get 'show_weekly_pairs' => 'teams#show_weekly_pairs'
    end
  end

  get '/about' => 'application#about'
end
