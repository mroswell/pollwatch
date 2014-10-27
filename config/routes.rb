require "domain_constraint"
  
Rails.application.routes.draw do
  get '/reporting' => 'reporting#home'
  resources :reports, except: [:delete, :edit, :update] do
    collection do
      get 'state_of_zip'
      get 'reports_in_zip'
    end
  end

  get "/viz(*screens)" => "pages#viz"
  get "/about" => "pages#about"



  if Rails.env.production?
    constraints DomainConstraint.new('pollwatch.us') do
      root to: 'reporting#home'
    end
  end

	root to: 'pages#home'
end
