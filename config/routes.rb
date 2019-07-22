Rails.application.routes.draw do
  get '/', to: 'search_repositories#index', as: 'search_repositories'
end
