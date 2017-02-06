require 'administrator_constraint'

Rails.application.routes.draw do

	mount Sidekiq::Web => '/sidekiq', :constraints => AdministratorConstraint.new

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'visitor#index'
	scope '/mail' do
		post '/contacts' => 'mail#contact', as: :mail_contacts
	end

	resources :sessions, only: [:new, :create, :destroy]

end
