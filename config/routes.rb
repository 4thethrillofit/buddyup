Buddyup::Application.routes.draw do
  root :to => "teams#index"
  resources :people, :except => [:edit, :update, :show]

  resources :teams, :except => [:edit, :update] do
    resources :team_assignments, :only => [:create, :destroy]
    # collection do
    #   get '/send_weekly_pairs'
    # end
  end
end
