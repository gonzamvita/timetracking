Rails.application.routes.draw do
  get '/' =>  'site#home'

  get '/contact' => 'contact#contact'

  get '/projects' => 'projects#index'
end
