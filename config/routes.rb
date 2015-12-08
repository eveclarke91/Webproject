Rails.application.routes.draw do
  

          resources :users
          resources :employees, only: [:create, :edit,:destroy, :view, :update]
          resources :shifts, only: [:create, :edit, :destroy, :view, :update]
          resources :holidays, only: [:create, :edit, :destroy, :view, :update]
          resources :rosters, only: [:create, :edit, :destroy, :view, :update]

          root 'static_pages#home'

          get 'help'       => 'static_pages#help'
          get 'about'      => 'static_pages#about'
          get 'contact'    => 'static_pages#contact'
          get 'signup'     => 'users#new'
          get '/signup'    => 'users#new'
          get 'employees'  => 'employees#new'
          get '/employees' => 'employees#new'
          get '/viewEmployees'   => 'employees#index'
          get '/employees/:id/edit' => 'employees#edit'
          patch '/employees/:id' => 'employees#update'
          put '/employees/:id' => 'employees#update'
          get '/employees/:id' => 'employees#show'
          
          get 'shifts'     => 'shifts#new'
          get '/shifts'    => 'shifts#new'
          get '/viewShifts'=> 'shifts#index'
          get '/shifts/:id/edit' => 'shifts#edit'
          patch '/shifts/:id' => 'shifts#update'
          put '/shifts/:id' => 'shifts#update'

          get 'holidays'   => 'holidays#new'
          get '/holidays'  => 'holidays#new'
          get '/viewHolidays' => 'holidays#index'
          get '/holidays/:id/edit' => 'holidays#edit'
          patch '/holidays/:id' => 'holidays#update'
          put '/holidays/:id' => 'holidays#update'


          get 'rosters'    => 'rosters#new'
          get '/rosters'   => 'rosters#new'
          get '/viewRosters' => 'rosters#index'
          get '/rosters/:id/edit' => 'rosters#edit'
          patch '/rosters/:id' => 'rosters#update'
          put '/rosters/:id' => 'rosters#update'


          get    'login'   => 'sessions#new'
          post   'login'   => 'sessions#create'
          delete 'logout'  => 'sessions#destroy'

         

      end