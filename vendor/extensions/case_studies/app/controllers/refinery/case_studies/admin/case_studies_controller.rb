module Refinery
  module CaseStudies
    module Admin
      class CaseStudiesController < ::Refinery::AdminController

        crudify :'refinery/case_studies/case_study',
                :xhr_paging => true

      end
    end
  end
end
