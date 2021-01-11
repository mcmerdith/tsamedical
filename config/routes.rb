Rails.application.routes.draw do
  # resources :models
  # GET       models#index   /models          (models_path)
  # POST      models#create  /models
  # GET       models#new     /models/new      (new_model_path)
  # GET       models#edit    /models/:id/edit (edit_model_path)
  # GET       models#show    /models/:id      (model_path)
  # PATCH/PUT models#update  /models/:id
  # DELETE    models#destroy /models/:id

  # Show all (authenticated) all => index
  get 'appointments/all'
  # Search an appointment by name and dob
  match 'appointments/my', via: [:get, :post]
  match 'appointments/search', via: [:get, :post]
  # Define the rest of the routes
  resources :appointments, except: [:index, :show]

  get 'providers/join';
  resources :providers

  resources :services

  # "more" pages
  get 'more/tsa'
  get 'more/cte'
  get 'more/devs'
  get 'more/site'
  get 'more/company'

  # The contact page has to perform like a contact but it doesn't actually need to do anything
  # Matching get and post to the same controller is unwise, but in this scenario, it's fine
  match '/contact', to: 'more#contact', via: [:get, :post]

  # Error matching
  get '/500', to: 'errors#server'
  get '/400', to: 'errors#invalidrequest'
  get '/401', to: 'errors#unauthorized'
  get '/403', to: 'errors#forbidden'
  get '/404', to: 'errors#notfound'
  get '/422', to: 'errors#unnacceptable'

  # Homepage
  root 'home#index'
end
