Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    post :import, on: :collection
    get :second_screen, on: :collection
    get :third_screen, on: :collection
    post :import_second_screen, on: :collection
    post :import_third_screen, on: :collection
    get :final_screen, on: :collection
 end
  root to: 'products#index'
end
