Rails.application.routes.draw do
 
 	devise_for :users, :controllers => { registrations: 'registrations' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
	devise_scope :user do
		root :to => 'devise/registrations#new' 
	end

	get 'tags/:tag', to: 'reachouts#index', as: :tag

	
	resources :users 	
	
	resources :profiles do
		resources :educations
		resources :researches
		resources :experiences
	end	
	
	resources :reachouts do
		resources :comments, only: [:create, :show, :edit, :update] , module: 'reachouts' do
			get :reply
		end
	end

	resources :events do
		resources :eventcomments, only: [:create, :show, :edit, :update] , module: 'events' do
			get :reply
	  end
	end

 



	get '/saved', to: 'reachouts#saved'
	get '/created', to: 'reachouts#created'
	get '/followed', to: 'reachouts#followed'
	post 'reachouts/follow'
	post 'reachouts/unfollow'
	post 'reachouts/save'
	post 'reachouts/unsave'
	post 'reachouts/pin'
	post 'reachouts/unpin'

	get 'messenger', to: 'messengers#index'
	get 'get_private_conversation', to: 'messengers#get_private_conversation'
	get 'get_group_conversation', to: 'messengers#get_group_conversation'
	get 'open_messenger', to: 'messengers#open_messenger'

	resources :events

	namespace :private do 
		resources :conversations, only: [:create] do
			member do
				post :close
				post :open
			end
		end
		resources :messages, only: [:index, :create]
	end

	namespace :group do 
		resources :conversations do
			member do
				post :close
				post :open
			end
		end
		resources :messages, only: [:index, :create]
	end

	post '/thank_you', to: 'static_pages#thank_you'
	get '/landing', to: 'static_pages#landing'

	post 'profiles/edit_skills'


end
