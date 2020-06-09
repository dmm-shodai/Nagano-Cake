Rails.application.routes.draw do
 devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :members, controllers: {
  sessions:      'members/sessions',
  passwords:     'members/passwords',
  registrations: 'members/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

scope module: 'member' do
	resources :addresses, only:[:index, :create, :edit, :update, :destroy]

	resources :items, only:[:index, :show]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
	resources :cart_items, only:[:create, :update, :index, :destroy]
  resources :orders, only:[:new, :index, :show, :create]
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/thanks' => 'orders#thanks'

	resources :members, only: [:show]
	root :to => 'members#top'
end


namespace :admin do
	resources :genres,only: [:index,:create,:edit,:update]
	resources :items,only: [:index,:new,:create,:show,:edit,:update]
end
end


# rails ルーティング　controller 検索