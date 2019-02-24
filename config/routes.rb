Rails.application.routes.draw do

  get 'users/about' => 'users#about'
  #deviseを使用する際にURLとしてusersを含むことを示している。
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only:[:show, :edit, :update, :destroy, :index, :create]

  resources :users, only:[:index, :show, :edit, :update]

  # root 'book_images#index'

  root to: 'users#top'


end
