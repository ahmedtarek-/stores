Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  match 'spaces/:id/price/:start_date/:end_date', to: 'spaces#price', via: 'get'

  resources :stores
  resources :spaces

end
