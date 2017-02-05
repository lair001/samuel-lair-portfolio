Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'visitor#index'
	scope '/mail' do
		post '/contacts' => 'mail#contact', as: :mail_contacts
	end

end
