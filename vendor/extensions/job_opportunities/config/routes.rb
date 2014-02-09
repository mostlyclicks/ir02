Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :job_opportunities do
    resources :job_opportunities, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :job_opportunities, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :job_opportunities, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
