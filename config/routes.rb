# Route prefixes use a single letter to allow for vanity urls of two or more characters
Rails.application.routes.draw do
  
  post '/confirm' => 'text_exchange#confirm', as: 'confirm_post'
  get '/confirm' => 'text_exchange#confirm', as: 'confirm'
  get '/confirm_check/:id' => 'text_exchange#confirm_check', as: 'confirm_check'
  
  get '/checkin' => 'text_exchange#checkin', as: 'checkin'
  get '/required_information' => 'text_exchange#additional_information', as: 'required_information'
  get '/thanks' => 'text_exchange#thanks', as: 'thanks'
  get '/survey' => 'text_exchange#alt_confirm', as: 'survey'

  get "preview/:number" => 'preview_message#show', as: "preview_message" if ENV['ALLOW_MESSAGE_PREVIEW'].present?
  post "preview/:number" => 'preview_message#submit', as: "preview_submit" if ENV['ALLOW_MESSAGE_PREVIEW'].present?

  if defined? Sidekiq
    require 'sidekiq/web'
    authenticate :user, lambda {|u| u.is_admin? } do
      mount Sidekiq::Web, at: '/admin/sidekiq/jobs', as: :sidekiq
    end
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin' if defined? RailsAdmin

  # Static pages
  match '/error' => 'pages#error', via: [:get, :post], as: 'error_page'
  get '/terms' => 'pages#terms', as: 'terms'
  get '/privacy' => 'pages#privacy', as: 'privacy'
  get '/about' => 'pages#about', as: 'about'
  get '/faq' => 'pages#faq', as: 'faq'
  
  post '/b/sms' => 'switchboard#sms', as: 'switchboard'

  # OAuth
  oauth_prefix = Rails.application.config.auth.omniauth.path_prefix
  get "#{oauth_prefix}/:provider/callback" => 'users/oauth#create'
  get "#{oauth_prefix}/failure" => 'users/oauth#failure'
  get "#{oauth_prefix}/:provider" => 'users/oauth#passthru', as: 'provider_auth'
  get oauth_prefix => redirect("#{oauth_prefix}/login")

  get '/:id' => "shortener/shortened_urls#show"

  # Devise
  devise_prefix = Rails.application.config.auth.devise.path_prefix
  devise_for :users, path: devise_prefix,
    controllers: {registrations: 'users/registrations', sessions: 'users/sessions',
      passwords: 'users/passwords', confirmations: 'users/confirmations', unlocks: 'users/unlocks'},
    path_names: {sign_up: 'signup', sign_in: 'login', sign_out: 'logout'}
  devise_scope :user do
    get "#{devise_prefix}/after" => 'users/registrations#after_auth', as: 'user_root'
  end
  get devise_prefix => redirect('/a/signup')

  # User
  resources :users, path: 'u', only: :show do
    resources :authentications, path: 'accounts'
  end
  get '/home' => 'users#show', as: 'user_home'

  # Dummy preview pages for testing.
  get '/p/test' => 'pages#test', as: 'test'
  get '/p/email' => 'pages#email' if ENV['ALLOW_EMAIL_PREVIEW'].present?

  get 'robots.:format' => 'robots#index'

  root 'pages#home'
end
