Rails.application.routes.draw do
  # devise_for :users

  devise_for :users
  devise_scope :user do
    get "/" => "devise/sessions#new"
  end

  # patient namespace
  namespace :patient do
    resources :patients
  end

  #doctor namespace
  namespace :doctor do
    resources :doctors
    # match "doctors/appointment_status"
    match "/appointment_status",to:"doctors#appointment_status", as: :appointment, via: [:get, :post]
  end

end
