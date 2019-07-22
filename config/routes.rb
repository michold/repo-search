Rails.application.routes.draw do
  get '/', to: 'search_repositories#index'
end
