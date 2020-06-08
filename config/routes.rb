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
	resources :cart_items, only:[:create, :update, :index, :destroy]
	delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
end


namespace :admin do
end
end


# rails ルーティング　controller 検索