module Refinery
  module CaseStudies
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::CaseStudies

      engine_name :refinery_case_studies

      initializer "register refinerycms_case_studies plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "case_studies"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.case_studies_admin_case_studies_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/case_studies/case_study'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CaseStudies)
      end
    end
  end
end
