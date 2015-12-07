Rails.application.routes.draw do
  

          resources :users
          resources :employees, only: [:create, :destroy, :view, :update]
          resources :shifts, only: [:create, :destroy, :view, :update]
          resources :holidays, only: [:create, :destroy, :view, :update]
          resources :rosters, only: [:create, :destroy, :view, :update]

          root 'static_pages#home'

          get 'help'       => 'static_pages#help'
          get 'about'      => 'static_pages#about'
          get 'contact'    => 'static_pages#contact'
          get 'signup'     => 'users#new'
          get '/signup'    => 'users#new'
          get 'employees'  => 'employees#new'
          get '/employees' => 'employees#new'
          get '/viewEmployees'   => 'employees#index'
          get 'shifts'     => 'shifts#new'
          get '/shifts'    => 'shifts#new'
          get '/viewShifts'=> 'shifts#index'
          get    'login'   => 'sessions#new'
          post   'login'   => 'sessions#create'
          delete 'logout'  => 'sessions#destroy'

         

      end