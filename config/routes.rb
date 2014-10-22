Rails.application.routes.draw do

  resources :polls, except: [:delete, :edit, :update] do
    collection do
      get 'state_of_zip'
      get 'polls_in_zip'
    end
  end
  resources :reports, except: [:delete, :edit, :update]

	root to: 'pages#home'
end
