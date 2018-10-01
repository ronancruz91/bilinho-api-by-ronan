Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	namespace 'api' do
		resources :instituicoes, only: [:index, :create] do
		end
		resources :alunos, only: [:index, :create] do
		end
		resources :matriculas, only: [:index, :create] do
			resources :faturas, only: [:index] do
			end
		end
	end
end
