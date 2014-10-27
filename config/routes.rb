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
    # FIXME: error
    # ArgumentError: Invalid route name, already in use: 'root'
    #        You may have defined two routes with the same name using the `:as` option, or you may be overriding a route already defined by a resource with the same naming. For the latter, you can restrict the routes created with `resources` as explained here:
    #        http://guides.rubyonrails.org/routing.html#restricting-the-routes-created
    constraints DomainConstraint.new('pollwatch.us') do
      root to: 'reporting#home'
    end
  end
  root to: 'pages#home'

end
