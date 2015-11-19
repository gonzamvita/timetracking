Rails.application.routes.draw do
  get '/' =>  'site#home'

  get '/contact' => 'contact#contact'

  # get '/projects' => 'projects#index'

  # get '/projects/:id' => 'projects#show'

  # get '/projects/:project_id/entries' => 'entries#index'

  # get '/projects/:project_id/entries/new' => 'entries#new'

  resources :projects, only: [:index, :show] do
    resources :entries, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
