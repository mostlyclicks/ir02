module Refinery
  module JobOpportunities
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::JobOpportunities

      engine_name :refinery_job_opportunities

      initializer "register refinerycms_job_opportunities plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "job_opportunities"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.job_opportunities_admin_job_opportunities_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/job_opportunities/job_opportunity'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::JobOpportunities)
      end
    end
  end
end
