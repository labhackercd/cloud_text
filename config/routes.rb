Rails.application.routes.draw do
  resources :text_imports, :only => [:create, :index]

  root to: 'text_imports#new'
end
