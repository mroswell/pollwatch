Rails.application.routes.draw do

  resources :reports, except: [:delete, :edit, :update] do
    collection do
      get 'state_of_zip'
      get 'reports_in_zip'
    end
  end
  
	root to: 'pages#home'
end
