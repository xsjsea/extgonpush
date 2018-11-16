Rails.application.routes.draw do
 
  resources :marketer_exts
  resources :bizcases
  resources :socail_accounts
  resources :social_channels
  resources :cases
  resources :reports
  get 'sessions/new'
  resources :tasks
  resources :orders
  resources :tags
  resources :schedules
  resources :areas
  resources :comments
  resources :contracts
  resources :posts
  resources :flows
  resources :social_accounts
  resources :categories
  resources :creator_exts
  resources :metrics
  resources :creator_metrics
  resources :services
  resources :users
  resources :campaigns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login' , to:'sessions#create'
  get '/logout' , to: 'sessions#destrory'
  get '/getOrder', to: 'orders#showOrder'
  post '/updatepost', to: 'orders#updatepost'
  post '/updatecomments', to: 'orders#updatecomments'
  post '/updatemessages', to: 'orders#updatemessages'
  post '/updateSchedule', to: 'orders#updateSchedule'
  get "orders/destroy/:id" => "orders#destroy"
  get "reports/destroy/:id" => "reports#destroy"
  get "social_accounts/destroy/:id" => "social_accounts#destroy"
  get "services/destroy/:id",to: "services#destroy"

  get "bizcases/destroy/:id" => "bizcases#destroy"
  get "creator_metrics/destroy/:id",to: "creator_metrics#destroy"

  
  post  '/getservice',to:'sessions#getservices'
  get '/inviterequired', to: 'users#inviterequired'
  post '/saveinviterequired' , to:'users#saveinviterequired'
  get '/updatepassword', to: 'users#updatepassword'
  post '/savepassword' , to:'users#savepassword'
  get '/userinfo', to: 'users#userinfo'
  get '/marketerinfo', to: 'users#marketerinfo'
  post '/savemarketerinfo' , to:'users#savemarketerinfo'
  post '/saveuserinfo' , to:'users#saveuserinfo'
 
  post '/upatesocialaccounts' , to:'social_accounts#upatesocialaccounts'

  root to: 'sessions#new'
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  get '/my_messages', to:'tasks#my_messages'

  get '/sendemail', to:'tasks#sendemail'

  #get '*path' => proc { |env| Rails.env.development? ? (raise ActionController::RoutingError, %{No route matches "#{env["PATH_INFO"]}"}) : ApplicationController.action(:render_not_found).call(env) }
end
