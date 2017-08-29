Rails.application.routes.draw do
   root 'users#index'

   post '/login' => 'sessions#create'
   delete '/logout/:id' => 'sessions#destroy'

   resources :users

   resources :organizations

   post '/join/:id' => 'members#create'
   delete '/leave/:id' => 'members#destroy'

end
