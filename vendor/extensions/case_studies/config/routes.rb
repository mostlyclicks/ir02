Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :case_studies do
    resources :case_studies, :path => '', :only => [:index, :show]
  end

  # namespace :case_studies, :path => '' do
  #   resources :case_studies, :path => '/case-studies', :only => [:index, :show]
  # end



  # Admin routes
  namespace :case_studies, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :case_studies, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
