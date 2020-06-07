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
	resources :members, only: [:show]
	root :to => 'members#top'
end
namespace :admin do
end
end
