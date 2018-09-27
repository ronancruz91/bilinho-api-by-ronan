Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	namespace 'api' do
		resources :instituicoes do
		end
		resources :alunos do
		end
		resources :matriculas do
		end
	end
end
