Rails.application.routes.draw do
  resources :doctors
  # resources :models
  # GET       models#index   /models          (models_path)
  # POST      models#create  /models
  # GET       models#new     /models/new      (new_model_path)
  # GET       models#edit    /models/:id/edit (edit_model_path)
  # GET       models#show    /models/:id      (model_path)
  # PATCH/PUT models#update  /models/:id
  # DELETE    models#destroy /models/:id

  # Define the rest of the routes
  resources :appointments, except: [:index, :show] do
    # Show all (authenticated) all => index
    collection do
      get 'all'
      # Search an appointment by name and dob
      match 'my', via: [:get, :post]
      match 'search', via: [:get, :post]
    end
    # Edit with an extra field for confirmed
    #get 'edit_admin', on: :member
  end

  resources :providers do
    get 'join', on: :collection
  end

  resources :services

  get 'more/faq'
  # The contact page has to perform like a contact but it doesn't actually need to do anything
  # Matching get and post to the same controller is unwise, but in this scenario, it's fine
  match '/contact', to: 'more#contact', via: [:get, :post]

  # "more" pages
  get 'more/tsa'
  get 'more/cte'
  get 'more/devs'
  get 'more/site'
  get 'more/company'
  get 'more/authenticate'
  get 'more/logout'

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
