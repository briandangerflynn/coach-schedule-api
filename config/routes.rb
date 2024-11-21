Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


  # Coach can create new appointment
  # Coach can see all of their own appointments
  # Coach can update finished appointment rating and notes
  # Student can see all available appointments
  # Student can update student_id of available appointments
  # Student can see all of their own appointments
  resources :appointments

  post "/create", to: "users#create"
  post "/login", to: "users#login"
  get "/current", to: "users#current"
end
