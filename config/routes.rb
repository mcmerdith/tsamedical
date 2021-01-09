Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/500', to: 'errors#server'
  get '/400', to: 'errors#invalidrequest'
  get '/401', to: 'errors#unauthorized'
  get '/403', to: 'errors#forbidden'
  get '/404', to: 'errors#notfound'
  get '/422', to: 'errors#unnacceptable'
end
